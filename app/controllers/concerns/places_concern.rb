module PlacesConcern
  extend ActiveSupport::Concern

  private

  def set_places
    @places = Place.order created_at: :desc
  end
end

