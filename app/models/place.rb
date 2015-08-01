class Place < ActiveRecord::Base
  validates_presence_of :name, :description, :image
end
