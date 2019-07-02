class AccountsController < ApplicationController
  
  def show
    account = Account.where("user_id = ?", params[:id])
    
    if account
      render json: account, status: :ok
    else
      render json: { errors: account.errors.full_messages }, status: :bad_request
    end

  end

  def set_balance
    account = Account.find(params[:id])
    account.balance += params[:value]
    if account.save
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

  def update
    account = Account.find(params[:id])

    if account.update!(account_params)
      render json: account, status: :ok
    else
      render json: {errors: account.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    account = Account.find(params[:id])

    if account.destroy!
      render status: :ok
    else
      render json: {errors: account.errors.full_messages}, status: :bad_request
    end
  end
  
  
  
  
  private

  def account_params
    params.require(:account).permit(:name, :balance, :kind, :user_id)
  end

end
