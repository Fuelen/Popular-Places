class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new place_params
    respond_to do |format|
      if @place.save
        flash[:success] = "New place has been added"
        format.html { redirect_to root_url }
      else
        format.html { render 'new' }
      end
    end

  end

  private

  def place_params
    params.require(:place).permit(:name,:description,:image)
  end
end
