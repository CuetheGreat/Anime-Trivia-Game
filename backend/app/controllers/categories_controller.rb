class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: @categories
  end

  def create
    @cat = Category.new(category_params)
    if @cat.save
      render json: @cat
    else
      render json: @cat.errors
    end
  end

  def show
    @cat = Category.find_by(slug: params[:id])
    if @cat
      render json: @cat
    else
      render json: { error: 'Not Found' }, status: :unprocessable_entity
    end
  end
end

def category_params
  params.require(:category).permit(:name)
end
