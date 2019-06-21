class IncomesController < ApplicationController

  # def show
  #   income = Income.find_by(params[:user_id])

  #   if income
  #     render json: income, status: :created
  #   else
  #     render json: { errors: income.errors.full_messages }, status: :bad_request
  #   end

  # end
  
  def create
    income = Income.new(income_params)
    
    if income.save
      render json: income, status: :created
    else
      render json: { errors: income.errors.full_messages }, status: :bad_request
    end

  end
  
  
  
  
  private

  def income_params
    params.require(:income).permit(:value, :month, :description, :category_id, :account_id)
  end



end
