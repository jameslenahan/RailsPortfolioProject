class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy] #set ingredient before changes made, "only" skips this step only for what comes after only

  def index
    if params[:recipe_id]
      @ingredients = Recipe.find(params[:recipe_id]).ingredients #if the ingredients are found in index, find them and instantiate into @ingredients
    else
      @ingredients = Ingredient.all #or else, create new instance of the ingredients

    end
  end

  def show
  end
  def new
    if params[:recipe_id]
      @recipe = Recipe.find(params[:cocktail_id])
      @recipe_ingredient = @recipe.recipe_ingredients.build #returns one or more objects of "recipes" (collection) that have been instantiated but not yet saved
      @ingredient = @recipe_ingredient.build_ingredient
    else
      @ingredient = Ingredient.new
    end
  end
  def edit
  end


  end

end