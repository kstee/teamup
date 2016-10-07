# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#require 'faker'

puts "Seeding table activities"

Activity.create(activity_type: "Futsal", description: "A form of indoor soccer with a small and heavier ball than normal.")

Activity.create(activity_type: "Badminton", description: "Hitting a birdie over a net with a long-necked racket. Doesn't sound very hard, does it?") 

Activity.create(activity_type: "Basketball", description: "A game played between two teams of five players in which goals are scored by throwing a ball through a netted hoop fixed above each end of the court.")

Activity.create(activity_type: "Hiking", description: "Walk for a long distance, especially across country or in the woods.")

Activity.create(activity_type: "Sepak Takraw", description: "A game originating in South Asia in which two teams kick a ball back and forth over a net")

Activity.create(activity_type: "Board Games", description: "Any game that comes in a box that you can play (eg. games with cards, games with a board, random pieces, etc.")

puts "Seeding Users"
