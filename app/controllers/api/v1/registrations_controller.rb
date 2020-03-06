class Api::V1::RegistrationsController < ApplicationController
    def create
      user = User.create!(
        username: params[:username],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
      )
  
      if user
        session[:user_id] = user.id
        payload = {user_id:user.id}
        token = encode_token(payload)
        render json: {
          status: :created,
          user: user,
          jwt: token
        }
      else
        render json: {
          status: 400
        }, status: 400
      end
    end
  end
  