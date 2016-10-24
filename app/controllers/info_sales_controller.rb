class InfoSalesController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_info_sale, only: [:show, :edit, :update, :destroy]
################################################

  def search
    index
    render :index
  end
  
  # GET /info_sales
  # GET /info_sales.json
  def index
    @info_sales = InfoSale.all
  end

  # GET /info_sales/1
  # GET /info_sales/1.json
  def show
  end

  # GET /info_sales/new
  def new
    @info_sale = InfoSale.new
  end

  # GET /info_sales/1/edit
  def edit
  end

  # POST /info_sales
  # POST /info_sales.json
  def create
    @info_sale = InfoSale.new(info_sale_params)

    respond_to do |format|
      if @info_sale.save
        format.html { 
          redirect_to @info_sale
          flash[:success] = 'Se ha creado.' }
        format.json { render :show, status: :created, location: @info_sale }
      else
        format.html { render :new }
        format.json { render json: @info_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /info_sales/1
  # PATCH/PUT /info_sales/1.json
  def update
    respond_to do |format|
      if @info_sale.update(info_sale_params)
        format.html { 
          redirect_to @info_sale
          flash[:success] = 'Se ha actualizado.' }
        format.json { render :show, status: :ok, location: @info_sale }
      else
        format.html { render :edit }
        format.json { render json: @info_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /info_sales/1
  # DELETE /info_sales/1.json
  def destroy
    @info_sale.destroy
    respond_to do |format|
      format.html { 
        redirect_to info_sales_url
        flash[:danger] = 'Se ha eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_info_sale
      @info_sale = InfoSale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def info_sale_params
      params.require(:info_sale).permit!#(:sale_id,:quantity, :price_sale, :lent_serial_id)
    end
end
