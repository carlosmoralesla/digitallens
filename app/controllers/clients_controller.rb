class ClientsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_client, only: [:show, :edit, :update, :destroy ]

################################################

  def search
    index
    render :index
  end
  
  # GET /clients
  # GET /clients.json
  def index
    @search_name = params[:search_name]

    # INICIO RANSACK
    @query = Client.ransack(params[:q])    
    @query.num_doc_cont = @search_name if @search_name.present?

    # PAGINACION Y ORDEN
    @results =  @query.result(distinct: true).paginate(:page => params[:page] )
     
    # RESULTADO FINAL
    @clients = @results    
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
    @type_clients = TypeClient.all
  end

  # GET /clients/1/edit
  def edit
     @type_clients = TypeClient.all
     @type_docs = TypeDoc.where('type_client_id = ?',@client.type_doc.type_client_id)
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    @type_clients = TypeClient.all

    respond_to do |format|
      if @client.save
        format.html { 
          redirect_to @client
          flash[:success] = 'Se ha creado.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
     @type_clients = TypeClient.all
     @type_docs = TypeDoc.where('type_client_id = ?',@client.type_doc.type_client_id)    
    respond_to do |format|
      if @client.update(client_params)
        format.html { 
          redirect_to @client
          flash[:success] = 'Se ha actualizado.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { 
        redirect_to clients_url
        flash[:danger] = 'Se ha eliminado.' }
      format.json { head :no_content }
    end
  end

  def find_type_doc
    @type_docs = TypeDoc.where(type_client_id: params[:type_client_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:company_name,:type_doc_id, :num_doc, :name, :last_name, :second_surname, :age, :sex, :address)
    end
end
