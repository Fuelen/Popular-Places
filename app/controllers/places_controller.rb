class PlacesController < ApplicationController
  before_action :define_new_place, only: [:index, :new]

  def index
    @places = Place.all
  end

  def new
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

  def define_new_place
    @place = Place.new
  end

  def place_params
    params.require(:place).permit(:name,:description,:image)
  end
end
