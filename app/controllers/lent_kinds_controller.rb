class LentKindsController < ApplicationController
  before_action :set_lent_kind, only: [:show, :edit, :update, :destroy]
################################################

  def search
    index
    render :index
  end
  
  # GET /lent_kinds
  # GET /lent_kinds.json
  def index
    @search_name = params[:search_name]

    # INICIO RANSACK
    @query = LentKind.ransack(params[:q])    
    @query.name_cont = @search_name if @search_name.present?

    # PAGINACION Y ORDEN
    @results =  @query.result(distinct: true).paginate(:page => params[:page] )
     
    # RESULTADO FINAL
    @lent_kinds = @results      
  end

  # GET /lent_kinds/1
  # GET /lent_kinds/1.json
  def show
  end

  # GET /lent_kinds/new
  def new
    @lent_kind = LentKind.new
  end

  # GET /lent_kinds/1/edit
  def edit
  end

  # POST /lent_kinds
  # POST /lent_kinds.json
  def create
    @lent_kind = LentKind.new(lent_kind_params)

    respond_to do |format|
      if @lent_kind.save
        format.html { redirect_to @lent_kind, notice: 'Lent kind was successfully created.' }
        format.json { render :show, status: :created, location: @lent_kind }
      else
        format.html { render :new }
        format.json { render json: @lent_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lent_kinds/1
  # PATCH/PUT /lent_kinds/1.json
  def update
    respond_to do |format|
      if @lent_kind.update(lent_kind_params)
        format.html { redirect_to @lent_kind, notice: 'Lent kind was successfully updated.' }
        format.json { render :show, status: :ok, location: @lent_kind }
      else
        format.html { render :edit }
        format.json { render json: @lent_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lent_kinds/1
  # DELETE /lent_kinds/1.json
  def destroy
    @lent_kind.destroy
    respond_to do |format|
      format.html { redirect_to lent_kinds_url, notice: 'Lent kind was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lent_kind
      @lent_kind = LentKind.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lent_kind_params
      params.require(:lent_kind).permit(:name)
    end
end
