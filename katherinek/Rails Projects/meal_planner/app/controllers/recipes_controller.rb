class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    t = Time.now
    @time = t.strftime("%H:%M")
  end

  def new 
  end

  def add
    recipe = Recipe.create(
      name: params[:name],
      desc: params[:desc],
      mealtime: params[:mealtime],
      preptime: params[:preptime],
      directions: params[:directions],
      notes: params[:notes],
      source: params[:source],
      cuisine: params[:cuisine],
      holiday: params[:holiday]
      )
    session[:recipe] = recipe.id
    return redirect_to "/ingredients/new"
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update(
      name: params[:name],
      desc: params[:desc],
      mealtime: params[:mealtime],
      preptime: params[:preptime],
      directions: params[:directions],
      notes: params[:notes],
      source: params[:source],
      cuisine: params[:cuisine],
      holiday: params[:holiday]
      )
    session['recipe'] = recipe.id
    return redirect_to "/recipes/index"
  end

  def delete
    recipe = Recipe.find(params['id'])
    recipe.destroy
    return redirect_to "/recipes/index"
  end

end
