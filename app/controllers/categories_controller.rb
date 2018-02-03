class CategoriesController < ApplicationController
before_action :require_admin, except: [:index, :show]
def index
  @categories = Category.paginate(page:params[:page], per_page: 5)
end

def new
  @category = Category.new
end

def create
  @category = Category.new(category_params)
  if @category.save
    flash[:success] = "Category has been successfully created"
    redirect_to categories_path
  else
    render 'new'
  end
end

def show
  @category = Category.find(params[:id])
  @category_articles = @category.articles.paginate(page: params[:page], per_page: 5)
end

def edit
  @category = Category.find(params[:id])
end

def update
  if @category = Category.update(category_params)
    flash[:success] = 'Category has been successfully updated'
  else
    render 'update'
  end
end
private
  def category_params
    params.require(:category).permit(:name)
    end
  def require_admin
    if !logged_in? || (logged_in? && !current_user.admin?)
      flash[:danger] = "Only admin can perform that action"
      redirect_to categories_path
    end
  end
end
