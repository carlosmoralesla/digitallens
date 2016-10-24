class SuppliersController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]
################################################

  def search
    index
    render :index
  end
  
  # GET /suppliers
  # GET /suppliers.json
  def index
    @search_name = params[:search_name]

    # INICIO RANSACK
    @query = Supplier.ransack(params[:q])    
    @query.num_doc_cont = @search_name if @search_name.present?

    # PAGINACION Y ORDEN
    @results =  @query.result(distinct: true).paginate(:page => params[:page] )
     
    # RESULTADO FINAL
    @suppliers = @results  
  end

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
    @type_clients = TypeClient.all
  end

  # GET /suppliers/1/edit
  def edit
     @type_clients = TypeClient.all
     @type_docs = TypeDoc.where('type_client_id = ?',@supplier.type_doc.type_client_id)    
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { 
          redirect_to @supplier
          flash[:success] = 'Se ha creado.' }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suppliers/1
  # PATCH/PUT /suppliers/1.json
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { 
          redirect_to @supplier
          flash[:success] = 'Se ha actualizado.' }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    @supplier.destroy
    respond_to do |format|
      format.html { 
        redirect_to suppliers_url
        flash[:danger] = 'Se ha eliminado.' }
      format.json { head :no_content }
    end
  end

  def find_type_doc
    @type_docs = TypeDoc.where(type_client_id: params[:type_client_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_params
      params.require(:supplier).permit(:name, :num_doc, :type_doc_id)
    end
end
