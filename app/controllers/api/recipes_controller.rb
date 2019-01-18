class Api::RecipesController < ApplicationController       #namespace
  def index
    @recipes = Recipe.all
    render 'index.json.jbuilder'
  end

  def show
    recipe_id = params[:id]     #you can put params[:id] in place of recipe_id on the next line
    @recipe = Recipe.find(recipe_id)
    render 'show.json.jbuilder'
  end

  def create
    @recipe = Recipe.new(
                          title: params[:title],
                          chef: params[:chef],
                          ingredients: params[:ingredients],
                          directions: params[:directions],
                          prep_time: params[:prep_time]
                        )
    @recipe.save
    render 'show.json.jbuilder'   #if we want to display one, we use the show view. 
  end
end
