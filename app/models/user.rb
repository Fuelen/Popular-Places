class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :recoverable,
  devise :database_authenticatable, :registerable,
          :rememberable, :trackable, :validatable
  has_many :likes

  def like?(place)
    likes.exists?(place: place)
  end

  def like!(place)
    place.likes.create!(user: self)
  end

  def unlike!(place)
    likes.where(place: place).first.destroy
    place.likes_count -= 1
  end
end
