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
  def create
    if ingredient_params[:recipe_id]
      @recipe = Recipe.find(ingredient_params)[:recipe_id])
      @ingredient = Ingredient.find_or_create_by(name: ingredient_params[:name])
      @recipe.recipe_ingredient.build(:ingredient_id => @ingredient.id, :quantity => ingredient_params[:recipe_ingredient][:quantity])
      if @recipe.save!
        redirect_to recipe_path(@recipe)
      else
        redirect_to new_recipe_ingredient_path(@recipe)
      end
    else
      @ingredient = Ingredient.create(ingredient_params)
      if @ingredient.save
        redirect_to ingredients_path
      else
        render 'new'
      end
    end
  end
end
  #def update
  #respond_to do |format|
  #if @ingredient.update(ingredient_params)
  ##end
      # end
