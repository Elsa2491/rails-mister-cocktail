class DosesController < ApplicationController
    # METHODE NEW
    # Trouver dans quel cocktail je mets une new dose
    # Pour ca, voir la route doses new : get/cocktails/:cocktail_id/doses/new
    # Creer une nouvelle dose
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

    # METHOD CREATE
    # Recuperer l'id du cocktail
    # Creer une dose avec les strong_params
    # Associer cette dose a un cocktail
    # Save la dose
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.delete
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
