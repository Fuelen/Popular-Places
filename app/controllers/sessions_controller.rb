class SessionsController < Devise::SessionsController
  respond_to :html, :js

  def create
    @places = Place.order created_at: :desc
    super
  end
end
