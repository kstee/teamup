# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'


# ************** SET UP *********************

puts "\n* * * * * * * * IMPORTANT * * * * * * * *\n"
puts "\nPlease make sure you have turned on Elastic Search before you continue!"
puts "\nYou now have 4 seconds to shut down the seeding by pressing Ctrl + C"
puts "\nSeeding will continue in..."
(4).downto(0) do |i|
	puts "#{i}"
	sleep(1)
end
puts "\n\n"

# ******************** Activities ********************


photo_dir = File.join(Rails.root, "app/assets/images/activities")
icon_dir = File.join(Rails.root, "app/assets/images/icons")

puts "Seeding table with 8 activities..."

Activity.create(activity_type: "Futsal", description: "A form of indoor soccer with a small and heavier ball than normal.", photo: File.open(File.join(photo_dir, 'futsal.png')), logo: File.open(File.join(icon_dir, 'icon-futsal.png')))
puts "Seeded Futsal"

Activity.create(activity_type: "Badminton", description: "Hitting a birdie over a net with a long-necked racket. Doesn't sound very hard, does it?", photo: File.open(File.join(photo_dir, 'badminton.png')), logo: File.open(File.join(icon_dir, 'icon-badminton.png'))) 
puts "Seeded Badminton"

Activity.create(activity_type: "Basketball", description: "A game played between two teams of five players in which goals are scored by throwing a ball through a netted hoop fixed above each end of the court.", photo: File.open(File.join(photo_dir, 'basketball.png')), logo: File.open(File.join(icon_dir, 'icon-basketball.png'))) 
puts "Seeded Basketball"

Activity.create(activity_type: "Hiking", description: "Walk for a long distance, especially across country or in the woods.", photo: File.open(File.join(photo_dir, 'hiking.png')), logo: File.open(File.join(icon_dir, 'icon-hiking.png'))) 
puts "Seeded Hiking"

Activity.create(activity_type: "Sepak Takraw", description: "A game originating in South Asia in which two teams kick a ball back and forth over a net.", photo: File.open(File.join(photo_dir, 'takraw.png')), logo: File.open(File.join(icon_dir, 'icon-takraw.png'))) 
puts "Seeded Sepak Takraw"

Activity.create(activity_type: "Board Games", description: "Any game that comes in a box that you can play (eg. games with cards, games with a board, random pieces, etc.", photo: File.open(File.join(photo_dir, 'board.png')), logo: File.open(File.join(icon_dir, 'icon-board.png'))) 
puts "Seeded Board Games"

Activity.create(activity_type: "Bowling", description: "A series of sports or leisure activities in which a player rolls or throws a bowling ball towards a target.", photo: File.open(File.join(photo_dir, 'bowling.png')), logo: File.open(File.join(icon_dir, 'icon-bowling.png')))
puts "Seeded Bowling" 

Activity.create(activity_type: "Football", description: "A family of team sports that involve, to varying degrees, kicking a ball with the foot to score a goal.", photo: File.open(File.join(photo_dir, 'football.png')), logo: File.open(File.join(icon_dir, 'icon-football.png'))) 
puts "Seeded Football"


puts "All Done!"

# ******************************* users *************************************

puts "Populating table with 4 super awesome users..."

pwd = '1234567890'

User.create(name: 'Glo', email: 'glo@teamup.com', gender: 2, bio: 'Co-Founder of TeamUp - The number 1 plateform that connects players for team activities', password: pwd)
User.create(name: 'Jeff', email: 'jeff@teamup.com', gender: 1, bio: 'Co-Founder of TeamUp - The number 1 plateform that connects players for team activities', password: pwd)
User.create(name: 'KwaiHee', email: 'kwaihee@teamup.com', gender: 2, bio: 'Co-Founder of TeamUp - The number 1 plateform that connects players for team activities', password: pwd)
User.create(name: 'Liren', email: 'liren@teamup.com', gender: 1, bio: 'Co-Founder of TeamUp - The number 1 plateform that connects players for team activities', password: pwd)

puts "Done. Now populate 16 other average users..."

user = {}
user['password'] = '1234567890'

20.times do 

	user['name'] = Faker::Name.first_name + ' ' + Faker::Name.last_name
	user['email'] = Faker::Internet.email
	user['gender'] = rand(1..2)

	if rand(2) == 0
		user['bio'] = Faker::ChuckNorris.fact
	else
		user['bio'] = Faker::StarWars.quote
	end

	User.create(user)
end

puts "Done creating users!"

# ********************** listings *****************************

puts "Populating table with 50 listings..."

listing = {}
uids = []
aids = []
keywords = ['friendly', 'competitive', 'intense', 'casual']

User.all.each { |u| uids << u.id }
Activity.all.each { |a| aids << a.id }

50.times do 

	listing['user_id'] = uids.sample
	listing['activity_id'] = aids.sample
	
	listing['description'] = Faker::Hipster.sentence
	listing['pax_existing'] = rand(0..15)
	listing['pax_needed'] = rand(1..10)

	listing['date'] = Faker::Date.forward(90)

	start_time = Faker::Time.forward(90)
	listing['starttime'] = start_time
	listing['endtime'] = start_time + [1800, 2700, 3600, 4500, 5400].sample

	listing['longitude'] = Faker::Address.longitude
	listing['latitude'] = Faker::Address.latitude

	Listing.create(listing)

end

puts "T H E  E N D"
