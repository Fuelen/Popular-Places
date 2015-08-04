require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
  let(:valid_params) {{ place: {name: "n", description: "d", image: "http://a.jpg"}}}
  let(:invalid_params) {{ place: {name: "n", description: "d", image: "g"}}}

  context "when visitor is guest" do
    describe "GET #index" do
      it "responds http success" do
        get :index
        expect(response).to have_http_status :success
      end
    end

    describe "POST #create" do
      it "responds http error on Ajax request" do
        xhr :post, :create
        expect(response).to have_http_status :found #302
      end
    end
  end

  context "when visitor is user" do
    login_user

    describe "GET #index" do
      it "responds http success" do
        get :index
        expect(response).to have_http_status :success
      end
    end

    describe "POST #create" do
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
end
