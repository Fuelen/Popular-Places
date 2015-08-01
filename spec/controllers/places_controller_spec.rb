require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
  let(:valid_params) {{ place: {name: "n", description: "d", image: "http://a.jpg"}}}
  let(:invalid_params) {{ place: {name: "n", description: "d", image: "g"}}}

  describe "GET #index" do
    it "responds http success" do
      get :index
      expect(response).to have_http_status :success
    end
  end

  describe "GET #new" do
    it "responds http success" do
      get :new
      expect(response).to have_http_status :success
    end
  end

  describe "POST #create" do
    it "responds http success when invalid params" do
      post :create, invalid_params
      expect(response).to have_http_status :success
    end

    it "redirects to root when valid params" do
      post :create, valid_params
      expect(response).to redirect_to root_url
    end

    it "responds http success on Ajax request when valid params" do
      xhr :post, :create, valid_params
      expect(response).to have_http_status :success
    end

    it "responds http success on Ajax request when invalid params" do
      xhr :post, :create, invalid_params
      expect(response).to have_http_status :success
    end

  end

end
