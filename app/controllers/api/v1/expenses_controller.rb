module Api::V1
  class ExpensesController < ApiController
    def find
      expenses = Expense.where("year = ? AND month = ? AND user_id = ?", params[:year], params[:month], params[:id])

      if expenses
        render json: expenses, status: :ok
      else
        render json: { errors: expenses.errors.full_messages }, status: :bad_request
      end
    end

    def create
      expense = Expense.new(expense_params)

      if expense.save
        render json: expense, status: :created
      else
        render json: { errors: expense.errors.full_messages }, status: :bad_request
      end
    end

    def show
      expenses = Expense.where("user_id = ?", params[:id])
      if expenses
        render json: expenses, status: :ok
      else
        render json: { errors: expenses.errors.full_messages }, status: :bad_request
      end
    end

    def update
      expense = Expense.find(params[:id])

      if expense.update(expense_params)
        render json: { status: "SUCCESS", message: "Expense updated" }, status: :ok
      else
        render json: { errors: expense.errors.full_messages }, status: :bad_request
      end
    end

    def destroy
      expense = Expense.find(params[:id])

      if expense.destroy
        render json: { status: "SUCCESS", message: "Expense deleted" }, status: :ok
      else
        render json: { errors: expense.errors.full_messages }, status: :bad_request
      end
    end

    private

    def expense_params
      params.require(:expense).permit(:value, :year, :month, :day, :description, :category_id, :account_id, :user_id)
    end
  end
end
