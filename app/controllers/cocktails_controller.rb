class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def destroy

  end

  private

  # Creation des strong_param
  # Prend les params. Requiert le param (:cocktail). Permet dessus (:name)
  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
