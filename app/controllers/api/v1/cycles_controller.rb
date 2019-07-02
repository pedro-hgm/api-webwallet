module Api::V1
  class CyclesController < ApiController
    def create
      cycle = Cycle.new(cycle_params)

      if cycle.save
        render json: cycle, status: :created
      else
        render json: { errors: cycle.errors.full_messages }, status: :bad_request
      end
    end

    def show
      cycles = Cycle.where("user_id = ?", params[:id])

      if cycles
        render json: cycles, status: :ok
      else
        render json: { errors: cycle.errors.full_messages }, status: :bad_request
      end
    end

    def complete_cycle

      # find the cycle with the id that is passed
      cycle = Cycle.find(params[:id])

      # with the date(year and month) and the user_id,
      # find the expenses and incomes that fullfill this conditions
      # i.e. the ones that have the same accounts_ids, etc
      expenses = Expense.where("year = ? AND month = ? AND user_id = ?", cycle.year, cycle.month, cycle.user_id)

      incomes = Income.where("year = ? AND month = ? AND user_id = ?", cycle.year, cycle.month, cycle.user_id)

      # create an array of expenses(hash) with only the values that I'm interested
      cycle_expenses = []

      expenses.each_with_index do |expense, index|
        expenses = Hash.new
        expenses[:id] = expense.id
        expenses[:value] = expense.value
        date = "#{expense.month} / #{expense.day} / #{expense.year}"
        expenses[:date] = date
        expenses[:description] = expense.description
        expenses[:account_name] = expense.account.name
        expenses[:category_name] = expense.category.name

        cycle_expenses[index] = expenses
      end

      # the same but now for the incomes
      cycle_incomes = []

      incomes.each_with_index do |income, index|
        incomes = Hash.new
        incomes[:id] = income.id
        incomes[:value] = income.value
        date = "#{income.month} / #{income.day} / #{income.year}"
        incomes[:date] = date
        incomes[:description] = income.description
        incomes[:account_name] = income.account.name

        cycle_incomes[index] = incomes
      end

      full_cycle = [cycle_incomes, cycle_expenses]

      # if everything worked fine, then render the result
      if full_cycle
        render json: full_cycle, status: :ok
      else
        render json: { errors: full_cycle.errors.full_messages }, status: :bad_request
      end
    end

    def current
      cycle = Cycle.find(params[:id])

      cycle.current = false

      if cycle.save
        render json: cycle, status: :ok
      else
        render json: { errors: cycle.errors.full_messages }, status: :bad_request
      end
    end

    private

    def cycle_params
      params.require(:cycle).permit(:year, :month, :current, :user_id)
    end
  end
end
