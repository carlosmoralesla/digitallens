class LentSerialsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_lent_serial, only: [:show, :edit, :update, :destroy]

################################################

  def search
    index
    render :index
  end
  
  # GET /lent_serials
  # GET /lent_serials.json
  def index
    @search_name = params[:search_name]

    # INICIO RANSACK
    @query = LentSerial.ransack(params[:q])    
    @query.name_cont = @search_name if @search_name.present?

    # PAGINACION Y ORDEN
    @results =  @query.result(distinct: true).paginate(:page => params[:page] )
     
    # RESULTADO FINAL
    @lent_serials = @results 
  end

  # GET /lent_serials/1
  # GET /lent_serials/1.json
  def show
  end

  # GET /lent_serials/new
  def new
    @lent_serial = LentSerial.new
    @lent_marks = LentMark.all
    @lent_colors = LentColor.all
    @lent_kinds = LentKind.all
  end

  # GET /lent_serials/1/edit
  def edit
    @lent_marks = LentMark.all
    @lent_models = LentModel.where('lent_mark_id = ?',@lent_serial.lent_model.lent_mark_id)
    @lent_colors = LentColor.all
    @lent_kinds = LentKind.all
  end

  # POST /lent_serials
  # POST /lent_serials.json
  def create
    @lent_serial = LentSerial.new(lent_serial_params)
    @lent_marks = LentMark.all
    @lent_colors = LentColor.all
    @lent_kinds = LentKind.all

    respond_to do |format|
      if @lent_serial.save
        format.html { 
          redirect_to @lent_serial
          flash[:success] = 'Se ha creado.' }
        format.json { render :show, status: :created, location: @lent_serial }
      else
        format.html { render :new }
        format.json { render json: @lent_serial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lent_serials/1
  # PATCH/PUT /lent_serials/1.json
  def update
    @lent_marks = LentMark.all
    @lent_models = LentModel.where('lent_mark_id = ?',@lent_serial.lent_model.lent_mark_id)
    @lent_colors = LentColor.all
    @lent_kinds = LentKind.all
        
    respond_to do |format|
      if @lent_serial.update(lent_serial_params)
        format.html { 
          redirect_to @lent_serial
          flash[:success] = 'Se ha actualizado.' }
        format.json { render :show, status: :ok, location: @lent_serial }
      else
        format.html { render :edit }
        format.json { render json: @lent_serial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lent_serials/1
  # DELETE /lent_serials/1.json
  def destroy
    @lent_serial.destroy
    respond_to do |format|
      format.html { 
        redirect_to lent_serials_url
        flash[:danger] = 'Se ha eliminado.' }
      format.json { head :no_content }
    end
  end

  def find_type_model
    @lent_models = LentModel.where(lent_mark_id: params[:lent_mark_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lent_serial
      @lent_serial = LentSerial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lent_serial_params
      params.require(:lent_serial).permit(:lent_kind_id,:name, :lent_color_id, :lent_model_id, :price_cost, :price_shop)
    end
end
