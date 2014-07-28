
venue = Venue.create({ venue: 'Republic Gastropub on Classen Curve', map_link: 'http://goo.gl/maps/1ktTV'})
venue = Venue.create({ venue: 'James E. McNellies Public House' , map_link: 'https://www.google.com/maps/place/James+E.+McNellie''s+Public+House/@35.479277,-97.521327,17z/data=!3m1!4b1!4m2!3m1!1s0x87b217347cf573e5:0xfc8b711954da4e4'})
venue = Venue.create({ venue: 'TapWerks Ale House', map_link: 'https://www.google.com/maps/place/TapWerks+Ale+House+%26+Cafe/@35.466577,-97.5096,17z/data=!3m1!4b1!4m2!3m1!1s0x0:0x8162386058d68e8a?hl=en'})
venue = Venue.create({ venue: 'Redpin Bowling Lounge', map_link: 'https://www.google.com/maps/place/RedPin+Bowling+Lounge/@35.463632,-97.509842,17z/data=!3m1!4b1!4m2!3m1!1s0x87b2172770ffab75:0x68464e5fb0c7350e?hl=en'})

#2013
[
  ["2013-07-18 17:30:00", 1, "Project auto scaffolding", "Best Chat Client/Protocol", "Microsoft Ending Technet", "Full Sail Session Black", "Black Mesa Blonde", "Rogue Dead Guy"],
  ["2013-08-22 17:30:00", 2, "Yeoman", "Mobile App vs Mobile Web", "Favorite Dev Setup (Hardware/Software)", "Green Flash Hop Head Red", "Left Hand Sawtooth", "Zatec Dark"],
  ["2013-09-19 17:30:00", 2, "Postgres 9.3", "Plastic iPhones", "Project Visualization", "Carlsberg Pilsner", "Black Sheep- Monty Python Holy Grail", "North Coast - Prankster"],
  ["2013-10-18 17:30:00", 2, "Ubuntu 13.10 * Windows 8.1", "Proliferation of Cordova", "Application Security", "North Coast - Red Seal Ale", "Ommegang -Three Philosophers", "Santa Fe - Happy Camper IPA"],
  ["2013-11-21 17:30:00", 1, "Go-lang", "RabbitMq", "Thunder Plains", "Green Flash Hop Head Red", "Shiner Wild Hare", "Coop Gransport Porter"],
  ["2013-12-19 17:30:00", 2, "Cloud IDEs", "Arduino Projects", "D3 Tricks", "Big Sky - Trout Slayer", "Black Mesa - Blonde", "Anchor Steam"],
].map { |args| Struct.new(:meeting_date, :venue_id, :topic1, :topic2, :topic3, :beer1, :beer2, :beer3).new(*args) }.each do |record|
  Agenda.create(meeting_date: record.meeting_date,
                venue_id:     record.venue_id,
                topic1:       record.topic1,
                topic2:       record.topic2,
                topic3:       record.topic3,
                beer1:        record.beer1,
                beer2:        record.beer2,
                beer3:        record.beer3)
end

#2014
[
  ["2014-01-16 17:30:00", 3, "", "", "", "", "", ""],
  ["2014-02-20 17:30:00", 2, "Docker", "Growth of Coffeescript", "What makes a good API", "Narwhal", "Java Stout", "Avery ipa"],
  ["2014-03-19 17:30:00", 4, "ElasticSearch", "Side Projects", "Atom", "Coop - F5", "Coop - Native Amber", "Bridgeport IPA"],
  ["2014-04-17 17:30:00", 4, "Microsoft/Nasa OSS", "Heartbleed", "Ubuntu 14.04/Windows XP", "Coop - F5", "GreenFlash Hop Head Red", "Coop - Native Amber"],
  ["2014-05-22 17:30:00", 4, "canary.io", "Death of TDD", "KcDc", "Avery - Ellies Brown Ale", "Avery - Out of Bounds Stout", "Coop F5"],
  ["2014-06-19 17:30:00", 4, "raspberry pi projects", "vagrant+ansible dev machines", "unified logging solutions", "TBD", "TBD", "TBD"],
].map { |args| Struct.new(:meeting_date, :venue_id, :topic1, :topic2, :topic3, :beer1, :beer2, :beer3).new(*args) }.each do |record|
  Agenda.create(meeting_date: record.meeting_date,
                venue_id:     record.venue_id,
                topic1:       record.topic1,
                topic2:       record.topic2,
                topic3:       record.topic3,
                beer1:        record.beer1,
                beer2:        record.beer2,
                beer3:        record.beer3)
end

suggestion = Suggestion.create("The \"Rails Way\"", "Anchor Steam")
suggestion = Suggestion.create("The Hidden Dangers of null", nil)
suggestion = Suggestion.create(nil, "Arrogant Bastard Ale")
