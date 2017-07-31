class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update]

  def index
    @categories = Category.all
  end

  def show
  end

  def edit
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(permitted_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def update
    if @category.update(permitted_params)
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  private

    def find_category
      @category = Category.friendly.find(params[:id])
    end

    def permitted_params
      params.require(:category).permit(:title)
    end
end
