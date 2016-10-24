class LentColorsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_lent_color, only: [:show, :edit, :update, :destroy]
################################################

  def search
    index
    render :index
  end
  
  # GET /lent_colors
  # GET /lent_colors.json
  def index
    @search_name = params[:search_name]

    # INICIO RANSACK
    @query = LentColor.ransack(params[:q])    
    @query.name_cont = @search_name if @search_name.present?

    # PAGINACION Y ORDEN
    @results =  @query.result(distinct: true).paginate(:page => params[:page] )
     
    # RESULTADO FINAL
    @lent_colors = @results   
  end

  # GET /lent_colors/1
  # GET /lent_colors/1.json
  def show
  end

  # GET /lent_colors/new
  def new
    @lent_color = LentColor.new
  end

  # GET /lent_colors/1/edit
  def edit
  end

  # POST /lent_colors
  # POST /lent_colors.json
  def create
    @lent_color = LentColor.new(lent_color_params)

    respond_to do |format|
      if @lent_color.save
        format.html { 
          redirect_to @lent_color
          flash[:success] = 'Se ha creado.' }
        format.json { render :show, status: :created, location: @lent_color }
      else
        format.html { render :new }
        format.json { render json: @lent_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lent_colors/1
  # PATCH/PUT /lent_colors/1.json
  def update
    respond_to do |format|
      if @lent_color.update(lent_color_params)
        format.html { 
          redirect_to @lent_color
          flash[:success] = 'Se ha actualizado.' }
        format.json { render :show, status: :ok, location: @lent_color }
      else
        format.html { render :edit }
        format.json { render json: @lent_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lent_colors/1
  # DELETE /lent_colors/1.json
  def destroy
    @lent_color.destroy
    respond_to do |format|
      format.html { 
        redirect_to lent_colors_url
        flash[:danger] = 'Se ha eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lent_color
      @lent_color = LentColor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lent_color_params
      params.require(:lent_color).permit(:name)
    end
end
