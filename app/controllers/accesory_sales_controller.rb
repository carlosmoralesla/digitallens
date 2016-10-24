class AccesorySalesController < ApplicationController
  before_action :set_accesory_sale, only: [:show, :edit, :update, :destroy]

  # GET /accesory_sales
  # GET /accesory_sales.json
  def index
    @accesory_sales = AccesorySale.all
  end

  # GET /accesory_sales/1
  # GET /accesory_sales/1.json
  def show
  end

  # GET /accesory_sales/new
  def new
    @accesory_sale = AccesorySale.new
  end

  # GET /accesory_sales/1/edit
  def edit
  end

  # POST /accesory_sales
  # POST /accesory_sales.json
  def create
    @accesory_sale = AccesorySale.new(accesory_sale_params)

    respond_to do |format|
      if @accesory_sale.save
        format.html { redirect_to @accesory_sale, notice: 'Accesory sale was successfully created.' }
        format.json { render :show, status: :created, location: @accesory_sale }
      else
        format.html { render :new }
        format.json { render json: @accesory_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accesory_sales/1
  # PATCH/PUT /accesory_sales/1.json
  def update
    respond_to do |format|
      if @accesory_sale.update(accesory_sale_params)
        format.html { redirect_to @accesory_sale, notice: 'Accesory sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @accesory_sale }
      else
        format.html { render :edit }
        format.json { render json: @accesory_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accesory_sales/1
  # DELETE /accesory_sales/1.json
  def destroy
    @accesory_sale.destroy
    respond_to do |format|
      format.html { redirect_to accesory_sales_url, notice: 'Accesory sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accesory_sale
      @accesory_sale = AccesorySale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accesory_sale_params
      params.require(:accesory_sale).permit(:quantity, :sale_id, :price_sale)
    end
end
