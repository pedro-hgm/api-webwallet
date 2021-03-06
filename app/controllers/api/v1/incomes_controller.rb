module Api::V1
  class IncomesController < ApiController
    def find
      incomes = Income.where("year = ? AND month = ? AND user_id = ?", params[:year], params[:month], params[:id])

      if incomes
        render json: incomes, status: :ok
      else
        render json: { errors: incomes.errors.full_messages }, status: :bad_request
      end
    end

    def show
      incomes = Income.where("user_id = ?", params[:id])
      if incomes
        render json: incomes, status: :ok
      else
        render json: { errors: incomes.errors.full_messages }, status: :bad_request
      end
    end

    def create
      income = Income.new(income_params)

      if income.save
        render json: income, status: :created
      else
        render json: { errors: income.errors.full_messages }, status: :bad_request
      end
    end

    def update
      income = Income.find(params[:id])

      if income.update(income_params)
        render json: { status: "SUCCESS", message: "Income updated" }, status: :ok
      else
        render json: { errors: income.errors.full_messages }, status: :bad_request
      end
    end

    def destroy
      income = Income.find(params[:id])

      if income.destroy
        render json: { status: "SUCCESS", message: "Income deleted" }, status: :ok
      else
        render json: { errors: income.errors.full_messages }, status: :bad_request
      end
    end

    private

    def income_params
      params.require(:income).permit(:value, :year, :month, :day, :description, :account_id, :user_id)
    end
  end
end
