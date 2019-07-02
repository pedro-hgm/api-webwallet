module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        categories = Category.all

        if categories
          render json: categories, status: :ok
        else
          render json: { errors: categories.errors.full_messages }, status: :bad_request
        end
      end

      def create
        category = Category.new(category_params)

        if category.save
          render json: category, status: :created
        else
          render json: { errors: category.errors.full_messages }, status: :bad_request
        end
      end

      def chart
        categories = Category.all

        expenses_by_category = []

        id = params[:id]

        categories.each do |category|
          c = Hash.new
          c[:name] = category.name

          e = category.expenses.where("user_id = ?", id)
          value = 0
          e.each do |expense|
            value += expense.value.to_f
          end
          c[:y] = value

          expenses_by_category.push(c)
        end

        if expenses_by_category
          render json: expenses_by_category, status: :ok
        else
          render json: { errors: expenses_by_category.errors.full_messages }, status: :bad_request
        end
      end

      private

      def category_params
        params.require(:category).permit(:name, :icon)
      end
    end
  end
end
