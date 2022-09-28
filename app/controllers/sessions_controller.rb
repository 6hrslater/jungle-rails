class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:user][:email], params[:user][:password])
      # Save the user id inside the browser cookie
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:error] = "Please enter a vaild username and password"
      #send back to the login form.
      redirect_to '/signin'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private

    # Only allow a list of trusted parameters through.
    def session_params
      params.require(:user).permit(
      :email,
      :password
    )
    end
end
