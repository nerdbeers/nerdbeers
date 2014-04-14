# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


venue = Venue.create({ venue: 'Republic Gastropub on Classen Curve', map_link: 'http://goo.gl/maps/1ktTV'})
venue = Venue.create({ venue: 'James E. McNellies Public House' , map_link: 'https://www.google.com/maps/place/James+E.+McNellie''s+Public+House/@35.479277,-97.521327,17z/data=!3m1!4b1!4m2!3m1!1s0x87b217347cf573e5:0xfc8b711954da4e4'})
venue = Venue.create({ venue: 'TapWerks Ale House', map_link: 'https://www.google.com/maps/place/TapWerks+Ale+House+%26+Cafe/@35.466577,-97.5096,17z/data=!3m1!4b1!4m2!3m1!1s0x0:0x8162386058d68e8a?hl=en'})
venue = Venue.create({ venue: 'Redpin Bowling Lounge', map_link: 'https://www.google.com/maps/place/RedPin+Bowling+Lounge/@35.463632,-97.509842,17z/data=!3m1!4b1!4m2!3m1!1s0x87b2172770ffab75:0x68464e5fb0c7350e?hl=en'})
