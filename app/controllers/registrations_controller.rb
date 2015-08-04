class RegistrationsController < Devise::RegistrationsController
  include PlacesConcern

  before_action :set_places, only: :create

  respond_to :html, :js
end
