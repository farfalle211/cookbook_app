class Api::RecipesController < ApplicationController       #namespace
  def index
    
    @recipes = Recipe.all

    search_terms = params[:search]    #these are string query params passed in by ?search= in the URL bar
    if search_terms 
      @recipes = @recipes.where("title iLike ?", "%#{search_terms}%")
    end

    @recipes = @recipes.order(:id => :asc)

    render 'index.json.jbuilder'
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

  def show

    recipe_id = params[:id]     #you can put params[:id] in place of recipe_id on the next line
    @recipe = Recipe.find(recipe_id)
    render 'show.json.jbuilder'
  end

  def update    #change a preexisting recipe
    @recipe = Recipe.find(params[:id])

    @recipe.title = params[:title] || @recipe.title
    @recipe.chef = params[:chef] || @recipe.chef
    @recipe.ingredients = params[:ingredients] || @recipe.ingredients
    @recipe.directions = params[:directions] || @recipe.directions
    @recipe.prep_time = params[:prep_time] || @recipe.prep_time
    @recipe.image_url = params[:irmage_url] || @recipe.image_url

    @recipe.save
    render 'show.json.jbuilder'
  end

  def destroy

    recipe = Recipe.find(params[:id])
    recipe.destroy
    render json: {message: "Successfully removed recipe"}
  end

end
