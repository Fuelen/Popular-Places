class Place < ActiveRecord::Base
  validates_presence_of :name, :description, :image
  validates :image, format: { with: /\Ahttps?:\/\/.+\.(jpe?g|png|gif)\z/i,
                              message: "must be URL to image"}
  belongs_to :user
end
