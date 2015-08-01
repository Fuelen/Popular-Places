require 'rails_helper'

RSpec.describe Place, type: :model do
  context "when creating" do
    let(:place) { create :place }

    it "has valid factory" do
      expect(place).to be_valid
    end

    it "has empty name" do
      place.name = nil
      expect(place).to be_invalid
    end

    it "has empty description" do
      place.description = nil
      expect(place).to be_invalid
    end

    it "has empty image" do
      place.image = nil
      expect(place).to be_invalid
    end

    it "has image which is not url" do
      place.image = 'lala.png'
      expect(place).to be_invalid
    end

    it "has image which is not image" do
      place.image = 'http://lala.com'
      expect(place).to be_invalid
    end
  end
end
