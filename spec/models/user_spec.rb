require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }
  let!(:place) { create(:place) }

  describe "#like?" do
    it { expect(user.like? place).to be false }
    it do
      user.likes.create place: place
      expect(user.like? place).to be true
    end
  end

  describe "#like!" do
    before { user.like! place }
    it { expect(place.likes.size).to eq 1 }
    it { user.like! place; expect(place.likes.size).to eq 1 }
  end

  describe "#unlike!" do
    before { user.like! place }
    it { user.unlike! place; expect(place.likes.size).to eq 0 }
    it do
      2.times { user.unlike! place }
      expect(place.likes.size).to eq 0
    end
  end
end
