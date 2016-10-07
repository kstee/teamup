# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#require 'faker'

puts "Seeding table activities"
Activity.create(id: 1, activity_type: "Futsal", description: "A form of indoor soccer with a small and heavier ball than normal.")
Activity.create(id: 2, activity_type: "Badminton", description: "Hitting a birdie over a net with a long-necked racket. Doesn't sound very hard, does it?") 
Activity.create(id: 3, activity_type: "Basketball", description: "A game played between two teams of five players in which goals are scored by throwing a ball through a netted hoop fixed above each end of the court.")
Activity.create(id: 4, activity_type: "Hiking", description: "Walk for a long distance, especially across country or in the woods.")
Activity.create(id: 5, activity_type: "Sepak Takraw", description: "A game originating in South Asia in which two teams kick a ball back and forth over a net")
Activity.create(id: 6, activity_type: "Board Games", description: "Any game that comes in a box that you can play (eg. games with cards, games with a board, random pieces, etc.")

puts "Seeding user_activities"
UserActivity.create(id: 1, user_id: 1, activity_id: 1, skill_level: 2, game_position: "Goalkeeper")
UserActivity.create(id: 2, user_id: 1, activity_id: 2, skill_level: 3)
UserActivity.create(id: 3, user_id: 2, activity_id: 1, skill_level: 2, game_position: "Defense")
UserActivity.create(id: 4, user_id: 3, activity_id: 3, skill_level: 1, game_position: "Point Guard")
UserActivity.create(id: 5, user_id: 3, activity_id: 4, skill_level: 2)

# puts "Seeding listings"
Listing.create(activity_id: 1, user_id: 1, description: "Looking for 2 more people to form a team!", listing_datetime: DateTime.now + 2.day, address: "One Utama Futsal Court", pax_existing: 3, pax_needed: 2, status: 0)
Listing.create(activity_id: 4, user_id: 2, description: "Fancy a day at the Hulu Langat waterfall?", listing_datetime: DateTime.now + 1.week, address: "Hulu Langat Hiking Trail", pax_existing: 2, pax_needed: 2, status: 0) 

puts "Seeding user_listings"
UserListing.create(listing_id: 1, user_id: 3)
UserListing.create(listing_id: 2, user_id: 2)

