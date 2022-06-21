class CategoriesController < ApplicationController
  def index
    cats = Category.all
    render json: { categories: cats }, except: :events
  end

  def create
    cat = Category.new(category_params)
    if cat.save
      render json: CategorySerializer.new(cat), status: :accepted
    else
      render json: { message: 'An Error Occurred', errors: cat.errors }, status: :unprocessable_entity
    end
  end

  def show
    cat = Category.find_by(slug: params[:id])
    if cat
      render json: cat, serializer: CategorySerializer, status: :accepted
    else
      render json: { message: 'Category Not Found', category: cat }, status: :unprocessable_entity
    end
  end

  def destroy
    cat = Category.find_by(slug: params[:id])
    name = cat.name
    cat.destroy
    render json: { message: `#{name} has been successfullly deleted.` }, status: :accepted
  end
end

def category_params
  params.require(:category).permit(:name)
end
