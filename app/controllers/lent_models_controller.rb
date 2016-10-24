class LentModelsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_lent_model, only: [:show, :edit, :update, :destroy]
################################################

  def search
    index
    render :index
  end
  
  # GET /lent_models
  # GET /lent_models.json
  def index
    @search_name = params[:search_name]

    # INICIO RANSACK
    @query = LentModel.ransack(params[:q])    
    @query.name_cont = @search_name if @search_name.present?

    # PAGINACION Y ORDEN
    @results =  @query.result(distinct: true).paginate(:page => params[:page] )
     
    # RESULTADO FINAL
    @lent_models = @results 
  end

  # GET /lent_models/1
  # GET /lent_models/1.json
  def show
  end

  # GET /lent_models/new
  def new
    @lent_model = LentModel.new
    @lent_marks = LentMark.all
  end

  # GET /lent_models/1/edit
  def edit
    @lent_marks = LentMark.all
  end

  # POST /lent_models
  # POST /lent_models.json
  def create
    @lent_model = LentModel.new(lent_model_params)
    @lent_marks = LentMark.all

    respond_to do |format|
      if @lent_model.save
        format.html { 
          redirect_to @lent_model
          flash[:success] = 'Se ha creado.' }
        format.json { render :show, status: :created, location: @lent_model }
      else
        format.html { render :new }
        format.json { render json: @lent_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lent_models/1
  # PATCH/PUT /lent_models/1.json
  def update
    @lent_marks = LentMark.all
    respond_to do |format|
      if @lent_model.update(lent_model_params)
        format.html { 
          redirect_to @lent_model
          flash[:success] = 'Se ha actualizado.' }
        format.json { render :show, status: :ok, location: @lent_model }
      else
        format.html { render :edit }
        format.json { render json: @lent_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lent_models/1
  # DELETE /lent_models/1.json
  def destroy
    @lent_model.destroy
    respond_to do |format|
      format.html { 
        redirect_to lent_models_url
        flash[:danger] = 'Se ha eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lent_model
      @lent_model = LentModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lent_model_params
      params.require(:lent_model).permit(:name, :lent_mark_id)
    end
end
