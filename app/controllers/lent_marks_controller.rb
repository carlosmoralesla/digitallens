class LentMarksController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_lent_mark, only: [:show, :edit, :update, :destroy]

################################################

  def search
    index
    render :index
  end
  
  # GET /lent_marks
  # GET /lent_marks.json
  def index
    @search_name = params[:search_name]

    # INICIO RANSACK
    @query = LentMark.ransack(params[:q])    
    @query.name_cont = @search_name if @search_name.present?

    # PAGINACION Y ORDEN
    @results =  @query.result(distinct: true).paginate(:page => params[:page] )
     
    # RESULTADO FINAL
    @lent_marks = @results 
  end

  # GET /lent_marks/1
  # GET /lent_marks/1.json
  def show
  end

  # GET /lent_marks/new
  def new
    @lent_mark = LentMark.new
  end

  # GET /lent_marks/1/edit
  def edit
  end

  # POST /lent_marks
  # POST /lent_marks.json
  def create
    @lent_mark = LentMark.new(lent_mark_params)

    respond_to do |format|
      if @lent_mark.save
        format.html { 
          redirect_to @lent_mark
          flash[:success] = 'Se ha creado.' }
        format.json { render :show, status: :created, location: @lent_mark }
      else
        format.html { render :new }
        format.json { render json: @lent_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lent_marks/1
  # PATCH/PUT /lent_marks/1.json
  def update
    respond_to do |format|
      if @lent_mark.update(lent_mark_params)
        format.html { 
          redirect_to @lent_mark
          flash[:success] = 'Se ha actualizado.' }
        format.json { render :show, status: :ok, location: @lent_mark }
      else
        format.html { render :edit }
        format.json { render json: @lent_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lent_marks/1
  # DELETE /lent_marks/1.json
  def destroy
    @lent_mark.destroy
    respond_to do |format|
      format.html { 
        redirect_to lent_marks_url
        flash[:danger] = 'Se ha eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lent_mark
      @lent_mark = LentMark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lent_mark_params
      params.require(:lent_mark).permit(:name)
    end
end
