class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create, :update, :destroy]

  def index
    if params[:user_id]
      @recipes = User.find(params[:user_id]).recipes
    else
      @recipes = Recipe.all
    end
    end
    def show
    end
  def new
    @recipe = Recipe.new
    5.times {@recipe.recipe_ingredients.build.build_ingredient}
  end
  def edit
  end
  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      5.times {@recipe.recipe_ingredients.build.build_ingredient}
      render 'new'
    end
  end
  def update
    respond_to do |format|
    end
  end

end
