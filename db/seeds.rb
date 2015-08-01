# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Place.delete_all
%w(
https://placemanagementandbranding.files.wordpress.com/2012/03/unbenannt3.jpg
https://s-media-cache-ak0.pinimg.com/736x/c4/50/3a/c4503aa9133df419b9651e9b75a3d217.jpg
https://s-media-cache-ak0.pinimg.com/736x/98/95/a9/9895a99be70c590da5699861d92e988e.jpg
http://www.urbanfarmonline.com/images/news/ihs-vertical-garden_250.jpg
http://blogs.smithsonianmag.com/adventure/files/2012/10/WineEnglandBIG.jpg
http://www.funonthenet.in/images/pics/places_to_go_before_u_die/10b_visit-places-alps.jpg
http://www.weirdhut.com/wp-content/uploads/2011/07/the-best-place-for-vacation.jpg
http://www.bloggs74.com/wp-content/uploads/places23.jpg
http://cdn.architecturendesign.net/wp-content/uploads/2014/09/1109.jpg
https://s-media-cache-ak0.pinimg.com/736x/18/99/c6/1899c66209355c8d37fd50d15b1a3b36.jpg
https://s-media-cache-ak0.pinimg.com/736x/bd/37/10/bd371049419c2308da8f94a568807cad.jpg
).each do |image|
  Place.create! name: Faker::Lorem.sentence,
                description: Faker::Lorem.sentence,
                image: image
end
