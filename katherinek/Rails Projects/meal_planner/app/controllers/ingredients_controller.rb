class IngredientsController < ApplicationController
  def index
  end

  def new
    @recipe = Recipe.find(session[:recipe])
    @proteins = Ingredient.find(:cat => "protein")
    puts @proteins
    @vegetables = Ingredient.filter(cat="vegetable")
    puts @vegetables
    @fruits = Ingredient.filter(cat="fruit")
    @grains = Ingredient.filter(cat="grain")
    @starches = Ingredient.filter(cat="starch")
    @sauces = Ingredient.filter(cat="sauce")
    @added_ingredients = @recipe.ingredients
    @ingredient_lists = Ingredient_List.filter(recipe.id=@recipe.id)
  end

  def add
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
