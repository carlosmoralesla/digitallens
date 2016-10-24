class SalesController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
################################################

  def search
    index
    render :index
  end
  # GET /sales
  # GET /sales.json
  def index
    @search_doc = params[:search_doc]

    # INICIO RANSACK
    @query = Sale.ransack(params[:q])    
    @query.num_sale_cont = @search_doc if @search_doc.present?

    # PAGINACION Y ORDEN
    @results =  @query.result(distinct: true).paginate(:page => params[:page] )
     
    # RESULTADO FINAL
    @sales = @results 
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    @lent_serials = LentSerial.all
    @lent_accesories = LentAccesory.all

    5.times do 
      @nested_info_sale = @sale.info_sales.build
    end

    @nested_accesory = @sale.accesory_sales.build

   
  end

  # GET /sales/1/edit
  def edit
     @lent_serials = LentSerial.all
     @lent_accesories = LentAccesory.all
     @client = Client.find(@sale.client_id)
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)
    @lent_serials = LentSerial.all
    @lent_accesories = LentAccesory.all

    respond_to do |format|
      if @sale.save
        format.html { 
          redirect_to @sale
          flash[:success] = 'Se ha creado.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    @lent_serials = LentSerial.all
    @lent_accesories = LentAccesory.all
    @client = Client.find(@sale.client_id)

    respond_to do |format|
      if @sale.update(sale_params)
        format.html { 
          redirect_to @sale
          flash[:success] = 'Se ha actualizado.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { 
        redirect_to sales_url
        flash[:danger] = 'Se ha eliminado.' }
      format.json { head :no_content }
    end
  end

####################################################
  
  def search_client

    @client = Client.where('num_doc = ?', params[:search_doc] ).first

  end 
####################################################

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit!#(:client_id,info_sales_attributes: [:id,:quantity,:client_id,:price_sale,:lent_serial_id,:_destroy])
      #contacts_attributes: [:id, :type_contact, :name, :lastname, :client_id, :position_id, :phone_mail, :phone ,:extension,:phone2,:_destroy ])
    end
end
