class LentTypesController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_lent_type, only: [:show, :edit, :update, :destroy]
################################################

  def search
    index
    render :index
  end
  
  # GET /lent_types
  # GET /lent_types.json
  def index
    @search_name = params[:search_name]

    # INICIO RANSACK
    @query = LentType.ransack(params[:q])    
    @query.name_cont = @search_name if @search_name.present?

    # PAGINACION Y ORDEN
    @results =  @query.result(distinct: true).paginate(:page => params[:page] )
     
    # RESULTADO FINAL
    @lent_types = @results 
  end

  # GET /lent_types/1
  # GET /lent_types/1.json
  def show
  end

  # GET /lent_types/new
  def new
    @lent_type = LentType.new
  end

  # GET /lent_types/1/edit
  def edit
  end

  # POST /lent_types
  # POST /lent_types.json
  def create
    @lent_type = LentType.new(lent_type_params)

    respond_to do |format|
      if @lent_type.save
        format.html { 
          redirect_to @lent_type
          flash[:success] = 'Se ha creado.' }
        format.json { render :show, status: :created, location: @lent_type }
      else
        format.html { render :new }
        format.json { render json: @lent_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lent_types/1
  # PATCH/PUT /lent_types/1.json
  def update
    respond_to do |format|
      if @lent_type.update(lent_type_params)
        format.html { 
          redirect_to @lent_type
          flash[:success] = 'Se ha actualizado.' }
        format.json { render :show, status: :ok, location: @lent_type }
      else
        format.html { render :edit }
        format.json { render json: @lent_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lent_types/1
  # DELETE /lent_types/1.json
  def destroy
    @lent_type.destroy
    respond_to do |format|
      format.html { 
        redirect_to lent_types_url
        flash[:danger] = 'Se ha actualizado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lent_type
      @lent_type = LentType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lent_type_params
      params.require(:lent_type).permit(:name)
    end
end
