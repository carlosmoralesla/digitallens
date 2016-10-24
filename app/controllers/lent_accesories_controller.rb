class LentAccesoriesController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_lent_accesory, only: [:show, :edit, :update, :destroy]
################################################

  def search
    index
    render :index
  end
  # GET /lent_accesories
  # GET /lent_accesories.json
  def index
    @search_name = params[:search_name]

    # INICIO RANSACK
    @query = LentAccesory.ransack(params[:q])    
    @query.name_cont = @search_name if @search_name.present?

    # PAGINACION Y ORDEN
    @results =  @query.result(distinct: true).paginate(:page => params[:page] )
     
    # RESULTADO FINAL
    @lent_accesories = @results   
  end

  # GET /lent_accesories/1
  # GET /lent_accesories/1.json
  def show
  end

  # GET /lent_accesories/new
  def new
    @lent_accesory = LentAccesory.new
  end

  # GET /lent_accesories/1/edit
  def edit
  end

  # POST /lent_accesories
  # POST /lent_accesories.json
  def create
    @lent_accesory = LentAccesory.new(lent_accesory_params)

    respond_to do |format|
      if @lent_accesory.save
        format.html { 
          redirect_to @lent_accesory
          flash[:success] = 'Se ha creado.' }
        format.json { render :show, status: :created, location: @lent_accesory }
      else
        format.html { render :new }
        format.json { render json: @lent_accesory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lent_accesories/1
  # PATCH/PUT /lent_accesories/1.json
  def update
    respond_to do |format|
      if @lent_accesory.update(lent_accesory_params)
        format.html { 
          redirect_to @lent_accesory
          flash[:success] = 'Se ha actualizado.' }
        format.json { render :show, status: :ok, location: @lent_accesory }
      else
        format.html { render :edit }
        format.json { render json: @lent_accesory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lent_accesories/1
  # DELETE /lent_accesories/1.json
  def destroy
    @lent_accesory.destroy
    respond_to do |format|
      format.html { 
        redirect_to lent_accesories_url
        flash[:danger] = 'Se ha eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lent_accesory
      @lent_accesory = LentAccesory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lent_accesory_params
      params.require(:lent_accesory).permit(:name, :price_cost, :price_shop)
    end
end
