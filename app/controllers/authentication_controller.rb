class AuthenticationController < ApplicationController
    def register
  
    end
  
    def signin
      @users = User.all
    end
  end