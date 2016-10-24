class SessionsController < Devise::SessionsController




  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
    #params[:notice] = "hola"
   # success: 'Se ha cerrado sesión correctamente.' 
  end
   after_action :logout_message, only: :destroy
   after_action :signin_message, only: :create

   private

   def logout_message
      flash[:notice] = ''
      flash[:success] = "Se ha cerrado sesión"
   end

   def signin_message
      flash[:notice] = ''
      flash[:success] = "Ha ingresado correctamente"
   end   

end