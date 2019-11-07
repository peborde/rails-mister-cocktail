class DosesController < ApplicationController
  before_action :set_cocktail, only: [:create, :new]

  def new
    @dose = Dose.new
  end

  # POST /cockatils/:cocktail_id/doses
  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail_id = params[:cocktail_id]
    # @dose.ingredient_id = params[:ingredient_id]
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
