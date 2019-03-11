class RecipesController < ApplicationController
  def index
  	# =>  if the keyword is not given set it up to chocolate
    keyword = params[:search] || "chocolate"

    # =>  find the available reciepts by calling the static method of Recipe Model and if there is nothing
    # 		return an empty array
    @recipes = (Recipe.for keyword) || []
  end
end
