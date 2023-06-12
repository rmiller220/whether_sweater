class Api::V0::SessionsController < ApplicationController
  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(session_params[:password])
      render json: UsersSerializer.new(user), status: 200
    else
      render json: {error: "Sorry, your credentials are bad."}, status: 401
    end
  end

  private
  
    def session_params
      params.permit(:email, :password)
    end
end