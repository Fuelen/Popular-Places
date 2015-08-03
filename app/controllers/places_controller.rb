class PlacesController < ApplicationController

  def index
    @places = Place.order created_at: :desc
    @place = Place.new
  end


  def create
    @place = Place.new place_params
    respond_to do |format|
      format.js   { render 'form' unless @place.save}
    end
  end

  private

  def place_params
    params.require(:place).permit(:name,:description,:image)
  end
end
