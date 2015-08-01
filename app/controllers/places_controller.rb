class PlacesController < ApplicationController
  before_action :define_new_place, only: [:index, :new]

  def index
    @places = Place.order created_at: :desc
  end

  def new
  end

  def create
    @place = Place.new place_params
    respond_to do |format|
      if @place.save
        @flash_message = "New place has been added"
        format.html do
          flash[:success] = @flash_message
          redirect_to root_url
        end
        format.js
      else
        format.html { render 'new' }
        format.js   { render 'form'}
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
