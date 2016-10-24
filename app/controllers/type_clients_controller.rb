class TypeClientsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_type_client, only: [:show, :edit, :update, :destroy]
################################################

  def search
    index
    render :index
  end
  
  # GET /type_accounts
  # GET /type_accounts.json
  def index
    @search_name = params[:search_name]

    # INICIO RANSACK
    @query = TypeClient.ransack(params[:q])    
    @query.name_cont = @search_name if @search_name.present?

    # PAGINACION Y ORDEN
    @results =  @query.result(distinct: true).paginate(:page => params[:page] )
     
    # RESULTADO FINAL
    @type_clients = @results 
  end

  # GET /type_accounts/1
  # GET /type_accounts/1.json
  def show
  end

  # GET /type_accounts/new
  def new
    @type_client = TypeClient.new
  end

  # GET /type_accounts/1/edit
  def edit
  end

  # POST /type_accounts
  # POST /type_accounts.json
  def create
    @type_client = TypeClient.new(type_client_params)

    respond_to do |format|
      if @type_client.save
        format.html { 
          redirect_to @type_client
          flash[:success] = 'Se ha creado.' }
        format.json { render :show, status: :created, location: @type_client }
      else
        format.html { render :new }
        format.json { render json: @type_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_accounts/1
  # PATCH/PUT /type_accounts/1.json
  def update
    respond_to do |format|
      if @type_client.update(type_client_params)
        format.html { 
          redirect_to @type_client
          flash[:success] = 'Se ha actualizado.' }
        format.json { render :show, status: :ok, location: @type_client }
      else
        format.html { render :edit }
        format.json { render json: @type_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_accounts/1
  # DELETE /type_accounts/1.json
  def destroy
    @type_client.destroy
    respond_to do |format|
      format.html { 
        redirect_to type_clients_url
        flash[:danger] = 'Se ha eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_client
      @type_client = TypeClient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_client_params
      params.require(:type_client).permit(:name)
    end
end
