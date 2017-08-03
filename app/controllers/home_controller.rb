class HomeController < ApplicationController

  def index
    @categories = Category.order(:title)
  end

end
