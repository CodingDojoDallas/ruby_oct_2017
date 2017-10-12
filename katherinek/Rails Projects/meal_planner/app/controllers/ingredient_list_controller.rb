class IngredientListController < ApplicationController
  def index
  end

  def new
  end

  def add
    print "you are in the ingredient join table realm"
    recipe = Recipe.find(params[:recipe])
    ingredient = Ingredient.find(params[:ingredient])
    @ingredient_list = IngredientList.create(ingredient:ingredient, recipe:recipe, amount:params[:amount])

    return redirect_to "/ingredients/new"
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end
end
