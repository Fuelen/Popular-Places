class PlacesController < ApplicationController
  before_action :authenticate_user! , only: :create
  # if user in one window has opened form to add new place and in another will
  # sign out, and when he try to add place then server respond
  # 422 Unprocessable Entity and throw exception. We catch this exception and
  # say browser to reload opened page.
  rescue_from ActionController::InvalidAuthenticityToken, with: :reload_page

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
      .merge(user: current_user)
  end

  def reload_page
    render js: "location.reload()"
  end
end
