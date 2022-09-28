class SessionsController < ApplicationController

    def new
    end
  
    def create
      user = User.find_by_email(session_params[:email])
      if user && user.authenticate(session_params[:password])
        session[:user_id] = user.id
        redirect_to '/'
      else
        # If user's login doesn't work, send them back to the login form.
        flash[:error] = "Please enter a vaild username and password"
        redirect_to '/signin'
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to '/'
    end
  
    private
  
      def session_params
        params.require(:user).permit(
        :email,
        :password
      )
      end
  end