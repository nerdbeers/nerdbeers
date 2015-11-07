Venue.create!({ venue: 'Republic Gastropub on Classen Curve', map_link: 'http://goo.gl/maps/1ktTV'})
Venue.create!({ venue: 'James E. McNellies Public House' , map_link: 'https://www.google.com/maps/place/James+E.+McNellie''s+Public+House/@35.479277,-97.521327,17z/data=!3m1!4b1!4m2!3m1!1s0x87b217347cf573e5:0xfc8b711954da4e4'})
Venue.create!({ venue: 'TapWerks Ale House', map_link: 'https://www.google.com/maps/place/TapWerks+Ale+House+%26+Cafe/@35.466577,-97.5096,17z/data=!3m1!4b1!4m2!3m1!1s0x0:0x8162386058d68e8a?hl=en'})
Venue.create!({ venue: 'Redpin Bowling Lounge', map_link: 'https://www.google.com/maps/place/RedPin+Bowling+Lounge/@35.463632,-97.509842,17z/data=!3m1!4b1!4m2!3m1!1s0x87b2172770ffab75:0x68464e5fb0c7350e?hl=en'})

# 2013
Agenda.create!(meeting_date: "2013-07-18 17:30:00", venue_id: 1, topic1: "Project auto scaffolding", topic2: "Best Chat Client/Protocol", topic3: "Microsoft Ending Technet", beer1: "Full Sail Session Black", beer2: "Black Mesa Blonde", beer3: "Rogue Dead Guy")
Agenda.create!(meeting_date: "2013-08-22 17:30:00", venue_id: 2, topic1: "Yeoman", topic2: "Mobile App vs Mobile Web", topic3: "Favorite Dev Setup (Hardware/Software)", beer1: "Green Flash Hop Head Red", beer2: "Left Hand Sawtooth", beer3: "Zatec Dark")
Agenda.create!(meeting_date: "2013-09-19 17:30:00", venue_id: 2, topic1: "Postgres 9.3", topic2: "Plastic iPhones", topic3: "Project Visualization", beer1:"Carlsberg Pilsner", beer2: "Black Sheep- Monty Python Holy Grail", beer3:"North Coast - Prankster")
Agenda.create!(meeting_date: "2013-10-18 17:30:00", venue_id: 2, topic1: "Ubuntu 13.10 * Windows 8.1", topic2: "Proliferation of Cordova", topic3: "Application Security", beer1: "North Coast - Red Seal Ale", beer2: "Ommegang -Three Philosophers", beer3:"Santa Fe - Happy Camper IPA")
Agenda.create!(meeting_date: "2013-11-21 17:30:00", venue_id: 1, topic1: "Go-lang", topic2: "RabbitMq", topic3: "Thunder Plains", beer1:"Green Flash Hop Head Red", beer2: "Shiner Wild Hare", beer3:"Coop Gransport Porter")
Agenda.create!(meeting_date: "2013-12-19 17:30:00", venue_id: 2, topic1: "Cloud IDEs", topic2: "Arduino Projects", topic3: "D3 Tricks", beer1: "Big Sky - Trout Slayer", beer2: "Black Mesa - Blonde", beer3:"Anchor Steam")

# 2014
Agenda.create!(meeting_date: "2014-01-16 17:30:00", venue_id: 3, topic1: "", topic2: "", topic3: "", beer1: "", beer2: "", beer3: "")
Agenda.create!(meeting_date: "2014-02-20 17:30:00", venue_id: 2, topic1: "Docker", topic2: "Growth of Coffeescript", topic3: "What makes a good API", beer1: "Narwhal", beer2: "Java Stout", beer3: "Avery ipa")
Agenda.create!(meeting_date: "2014-03-19 17:30:00", venue_id: 4, topic1: "ElasticSearch", topic2: "Side Projects", topic3: "Atom", beer1: "Coop - F5", beer2: "Coop - Native Amber", beer3: "Bridgeport IPA")
Agenda.create!(meeting_date: "2014-04-17 17:30:00", venue_id: 4, topic1: "Microsoft/Nasa OSS", topic2: "Heartbleed", topic3: "Ubuntu 14.04/Windows XP", beer1: "Coop - F5", beer2: "GreenFlash Hop Head Red", beer3: "Coop - Native Amber")
Agenda.create!(meeting_date: "2014-05-22 17:30:00", venue_id: 4, topic1: "canary.io", topic2: "Death of TDD", topic3: "KcDc", beer1: "Avery - Ellies Brown Ale", beer2: "Avery - Out of Bounds Stout", beer3: "Coop F5")
Agenda.create!(meeting_date: "2014-06-19 17:30:00", venue_id: 4, topic1: "raspberry pi projects", topic2: "vagrant+ansible dev machines", topic3: "unified logging solutions", beer1: "TBD", beer2: "TBD", beer3: "TBD")


Suggestion.create!("The \"Rails Way\"", "Anchor Steam")
Suggestion.create!("The Hidden Dangers of null", nil)
Suggestion.create!(nil, "Arrogant Bastard Ale")
