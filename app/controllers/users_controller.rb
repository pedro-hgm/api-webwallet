class UsersController < ApplicationController
  
  def create
    
    user = User.new(user_params)

    if user.save
      render json: {status: 'User created successfully'}, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end

  end

  def login
    
    # findind the user by the email that is passed
    user = User.find_by(email: params[:email].to_s.downcase)

    # the authenticate method is part of the has_secure_password helper
    if user && user.authenticate(params[:password])
      # encode the user into a JWT token, from the jwt lib
      auth_token = JsonWebToken.encode({user_id: user.id})
      render json: {auth_token: auth_token}, status: :ok
    else
      render json: {error: 'Invalid username / password'}, status: :unauthorized
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
