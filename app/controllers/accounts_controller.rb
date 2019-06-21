class AccountsController < ApplicationController
  
  def show
    account = Account.find_by(params[:user_id])

    if account
      render json: account, status: :created
    else
      render json: { errors: account.errors.full_messages }, status: :bad_request
    end

  end
  
  def create
    account = Account.new(account_params)
    
    if account.save
      render json: account, status: :created
    else
      render json: { errors: account.errors.full_messages }, status: :bad_request
    end

  end
  
  
  
  
  private

  def account_params
    params.require(:account).permit(:name, :balance, :kind, :user_id)
  end

end
