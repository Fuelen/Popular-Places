FactoryGirl.define do
  factory :place, class: Place do
    name Faker::Lorem.sentence
    description Faker::Lorem.sentence
    image "http://example.com/image.jpg"
  end

end
