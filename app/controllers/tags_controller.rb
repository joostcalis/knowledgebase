class TagsController < ApplicationController
  before_action :find_tag, only: [:edit, :update]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def edit
  end

  def create
    @tag = Tag.new(permitted_params)
    if @tag.save
      redirect_to tags_path
    else
      render :new
    end
  end

  def update
    if @tag.update(permitted_params)
      redirect_to tags_path
    else
      render :edit
    end
  end

  private

    def find_tag
      @tag = Tag.find(params[:id])
    end

    def permitted_params
      params.require(:tag).permit(:title)
    end
end
