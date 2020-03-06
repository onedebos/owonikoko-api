class Api::V1::SessionsController < ApplicationController
    # include CurrentUserConcern
    
    def create
      user = User.find_by(username: params[:username])
        .try(:authenticate, params[:password])
  
      if user
        session[:user_id] = user.id
        payload = {user_id: user.id}
        token = encode_token(payload)
        render json: {
          status: :created,
          logged_in: true,
          user: user,
          jwt: token,
          success: "Welcome back, #{user.username}"
        }
      else
        render json: {
          status: 400
        }, status: 400
      end
    end
  
    def logged_in
      if session_user
        render json: {
          logged_in: true,
          user: session_user
        }
      else
        render json: {
          logged_in: false,
          errors: "No user logged in"
        }
      end
    end
  
    def logout
      reset_session
      render json: { status: 200, logged_out: true }
    end
  end
  