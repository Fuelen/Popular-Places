FactoryGirl.define do
  factory :place, class: Place do
    name Faker::Lorem.sentence
    description Faker::Lorem.sentence
    image "http://www.imagemagick.org/image/wizard.jpg"
  end

end
