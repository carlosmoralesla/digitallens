class MontureTypesController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_monture_type, only: [:show, :edit, :update, :destroy]
################################################

  def search
    index
    render :index
  end
  # GET /monture_types
  # GET /monture_types.json
  def index
    @search_name = params[:search_name]

    # INICIO RANSACK
    @query = MontureType.ransack(params[:q])    
    @query.name_cont = @search_name if @search_name.present?

    # PAGINACION Y ORDEN
    @results =  @query.result(distinct: true).paginate(:page => params[:page] )
     
    # RESULTADO FINAL
    @monture_types = @results 
  end

  # GET /monture_types/1
  # GET /monture_types/1.json
  def show
  end

  # GET /monture_types/new
  def new
    @monture_type = MontureType.new
  end

  # GET /monture_types/1/edit
  def edit
  end

  # POST /monture_types
  # POST /monture_types.json
  def create
    @monture_type = MontureType.new(monture_type_params)

    respond_to do |format|
      if @monture_type.save
        format.html { 
          redirect_to @monture_type
          flash[:success] = 'Se ha creado.' }
        format.json { render :show, status: :created, location: @monture_type }
      else
        format.html { render :new }
        format.json { render json: @monture_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monture_types/1
  # PATCH/PUT /monture_types/1.json
  def update
    respond_to do |format|
      if @monture_type.update(monture_type_params)
        format.html { 
          redirect_to @monture_type
          flash[:success] = 'Se ha actualizado.' }
        format.json { render :show, status: :ok, location: @monture_type }
      else
        format.html { render :edit }
        format.json { render json: @monture_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monture_types/1
  # DELETE /monture_types/1.json
  def destroy
    @monture_type.destroy
    respond_to do |format|
      format.html { 
        redirect_to monture_types_url
        flash[:danger] = 'Se ha eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monture_type
      @monture_type = MontureType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monture_type_params
      params.require(:monture_type).permit(:name)
    end
end
