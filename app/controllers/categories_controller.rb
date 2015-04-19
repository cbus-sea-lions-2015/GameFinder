class CategoriesController < SecuredController
  def index
    all_categories = Category.all
    render json: all_categories.to_json
  end
end
