class CategoriesController < ApplicationController

  # def show
  #   category = Category.find_by(params[:user_id])

  #   if category
  #     render json: category, status: :created
  #   else
  #     render json: { errors: category.errors.full_messages }, status: :bad_request
  #   end

  # end
  
  def create
    category = Category.new(category_params)
    
    if category.save
      render json: category, status: :created
    else
      render json: { errors: category.errors.full_messages }, status: :bad_request
    end

  end
  
  
  
  
  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end


end
