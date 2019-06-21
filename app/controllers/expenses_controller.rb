class ExpensesController < ApplicationController

  # def show
  #   expense = Expense.find_by(params[:user_id])

  #   if income
  #     render json: expense, status: :created
  #   else
  #     render json: { errors: expense.errors.full_messages }, status: :bad_request
  #   end

  # end
  
  def create
    expense = Expense.new(expense_params)
    
    if expense.save
      render json: expense, status: :created
    else
      render json: { errors: expense.errors.full_messages }, status: :bad_request
    end

  end
  
  
  
  
  private

  def expense_params
    params.require(:expense).permit(:value, :month, :description, :category_id, :account_id)
  end



end
