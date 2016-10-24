class HistoryClientsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_history_client, only: [:show, :edit, :update, :destroy]

################################################

  def search
    index
    render :index
  end
  
  # GET /history_clients
  # GET /history_clients.json

  def index
    @search_code = params[:search_code]

    # INICIO RANSACK
    @query = HistoryClient.ransack(params[:q])    
    @query.num_consult_cont = @search_code if @search_code.present?

    # PAGINACION Y ORDEN
    @results =  @query.result(distinct: true).paginate(:page => params[:page] )
     
    # RESULTADO FINAL
    @history_clients = @results   
  end

  # GET /history_clients/1
  # GET /history_clients/1.json
  def show
    @client = Client.find(@history_client.client_id)
  end

  # GET /history_clients/new
  def new
    @history_client = HistoryClient.new
    @client = Client.find(params[:client_id])
    @lent_types = LentType.all
  end

  # GET /history_clients/1/edit
  def edit
    @client = Client.find(@history_client.client_id)
    @lent_types = LentType.all    
  end

  # POST /history_clients
  # POST /history_clients.json
  def create
    @history_client = HistoryClient.new(history_client_params)

    respond_to do |format|
      if @history_client.save
        format.html { 
          redirect_to @history_client
          flash[:success] = 'Se ha creado.' }
        format.json { render :show, status: :created, location: @history_client }
      else
        format.html { render :new }
        format.json { render json: @history_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /history_clients/1
  # PATCH/PUT /history_clients/1.json
  def update
    respond_to do |format|
      if @history_client.update(history_client_params)
        format.html { 
          redirect_to @history_client
          flash[:success] = 'Se ha actualizado.' }
        format.json { render :show, status: :ok, location: @history_client }
      else
        format.html { render :edit }
        format.json { render json: @history_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /history_clients/1
  # DELETE /history_clients/1.json
  def destroy
    @client = Client.find(@history_client.client_id)
    @history_client.destroy
    respond_to do |format|
      format.html { 
        redirect_to client_path(@client)
        flash[:danger] = 'Se ha eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history_client
      @history_client = HistoryClient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def history_client_params
      params.require(:history_client).permit(:client_id, :date_consult, :num_consult, :anamnesis, :past_eye_left, :past_eye_right, :past_lent_type_id, :current_eye_left, :current_eye_right, :current_lent_type_id, :add_near, :add_intermedium, :add_alt, :result_info, :recommend_info )
    end
end
