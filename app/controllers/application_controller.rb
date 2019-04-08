class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @category=Category.all
    if params[:category_id]
      category=  Category.find(params[:category_id])
    end
  end

end
