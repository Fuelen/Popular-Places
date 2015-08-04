require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
  let!(:place) { create(:place) }
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

    describe "POST #like" do
      it "responds http error on Ajax request" do
        xhr :post, :like, id: place.id
        expect(response).to have_http_status :found #302
      end
    end

    describe "DELETE #unlike" do
      it "responds http error on Ajax request" do
        xhr :delete, :unlike, id: place.id
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

    describe "POST #like" do
      it "responds http error on Ajax request when valid id" do
        xhr :post, :like, id: place.id
        expect(response).to have_http_status :success
      end

      it "responds http error on Ajax request when invalid id" do
        expect{ xhr :post, :like, id: 0 }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    describe "DELETE #like" do
      it "responds http error on Ajax request when valid id" do
        xhr :delete, :unlike, id: place.id
        expect(response).to have_http_status :success
      end

      it "responds http error on Ajax request when invalid id" do
        expect{ xhr :delete, :unlike, id: 0 }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
