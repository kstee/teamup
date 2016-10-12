# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#require 'faker'

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
User.create(name: 'Tee', email: 'kstee@teamup.com', gender: 1, bio: 'Co-Founder of TeamUp - The number 1 plateform that connects players for team activities', password: pwd)
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

# ******************************* activity descriptions *************************************

puts "Coming up with some awesome activity descriptions..."

d_futsal = ["Looking for competitive futsal players", "Need 2 more players for friendly match", "Futsal this weekend?", "Need more futsal players for social match"]
d_badminton = ["Want to be the next Lee Chong Wei?", "2 more female players needed for badminton doubles", "Anyone up for a friendly badminton match?"]
d_basketball = ["5-on-5 street basketball. Looking for another team.", "Midnight bball anyone?"]
d_hiking = ["Fancy a walk at Bukit Gasing?", "Looking for hiking buddy at Gunung Tahan", "Jom Bukit Tabur!"]
d_sepak_takraw = ["Sepal takraw social match", "Looking for 2 more players to be in sepak takraw team"]
d_board_games = ["Conquer the world with RISK!", "Small World players wanted!", "Anyone wants to Bang?!", "The REAL Monopoly game - any takers?", "Needed: Munchkins kakis!", "Serious Citadel players wanted"]
d_bowling = ["Bowling buddies wanted", "Competitve bowling buddies", "Training buddy needed for competition preparation"]
d_football = ["Ola bola!", "Looking for 5 more players for a casual match", "Turun padang main bola!"]

puts "Done creating descriptions!"

# ********************** listings *****************************

puts "Populating table with 50 listings..."

listing = {}
uids = []
aids = []

User.all.each { |u| uids << u.id }
Activity.all.each { |a| aids << a.id }

50.times do 

	listing['user_id'] = uids.sample
	
	aid = aids.sample
	listing['activity_id'] = aid	
	# the description will be dependent on the activity id
	case aid 
		when 1
			listing['description'] = d_futsal.sample

			# populate the address with real futsal courts
			r = rand(3)
			if ( r == 0)
				listing['longitude'] = 101.66563010000004
				listing['latitude'] = 3.105876
				listing['address'] = 'Pantai Hillpark Futsal Park Kuala Lumpur'
			elsif ( r== 1)
				listing['longitude'] = 101.73618950000002
				listing['latitude'] = 3.202579
				listing['address'] = 'Center Mart Futsal Court Kuala Lumpur'
			elsif ( r==2 )
				listing['longitude'] = 101.63323500000001
				listing['latitude'] = 3.113687		
				listing['address'] = 'The Challenger Sports Centre Petaling Jaya Selangor'
			else
				listing['latitude'] = 2.9746324
				listing['longitude'] = 101.75131499999998 
				listing['address'] = 'Uptown Sports Bangi, Selangor'
			end

		when 2
			listing['description'] = d_badminton.sample
			
			# populate the address with real badminton courts
			r = rand(3)
			if ( r == 0)
				listing['longitude'] = 101.64946110000005
				listing['latitude'] = 3.0841051
				listing['address'] = 'New Vision Badminton Academy Petaling Jaya Selangor'
			elsif ( r== 1)
				listing['longitude'] = 100.31469919999995 
				listing['latitude'] = 5.421035
				listing['address'] = 'Penang Hotel Badminton Court'
			elsif ( r==2 )
				listing['longitude'] = '101.59009420000007'
				listing['latitude'] = '3.15542'
				listing['address'] ='Sunsuria Badminton Court PJ, Selangor'				
			else
				listing['longitude'] = 102.22987290000003
				listing['latitude'] = 2.2159471		
				listing['address'] = 'Dewan Badminton Seri Pandan Melaka'
			end

		when 3
			listing['description'] = d_basketball.sample

			# populate the address with real basketball courts
			r = rand(2)
			if ( r == 0)
				listing['longitude'] = 110.32354009999995
				listing['latitude'] = 1.5105885
				listing['address'] = 'Arang Road Basketball Court, Kuching, Sarawak'
			elsif ( r == 1)
				listing['longitude'] = 103.64127940000003
				listing['latitude'] = 1.5578533
				listing['address'] = 'Basketball Court KTC Skudai, Johor'				
			else
				listing['longitude'] = 101.63116960000002
				listing['latitude'] = 3.2031245	
				listing['address'] = 'Taman Bukit Maluri Basketball Court Kuala Lumpur'			
			end
		
		when 4
			hiking_venue = d_hiking.sample
			listing['description'] = hiking_venue
			
			if ( d_hiking.index(hiking_venue) == 0 ) #bukit gasing
				listing['longitude'] = 101.656131
				listing['latitude'] = 3.095138
				listing['address'] = 'Bukit Gasing, Selangor'
			elsif ( d_hiking.index(hiking_venue) == 1 ) #gunung tahan
				listing['longitude'] = 102.23416659999998
				listing['latitude'] = 4.632499999999999
				listing['address'] = 'Gunung Tahan, Pahang'	
			else #bukit tabur
				listing['longitude'] = 101.74777799999993
				listing['latitude'] = 3.234722
				listing['address'] = 'Bukit Tabur, Selangor'				
			end

		when 5
			listing['description'] = d_sepak_takraw.sample
			listing['longitude'] = 101.66221580000001
			listing['latitude'] = 3.0813373
			listing['address'] = 'Sports Arena Sentosa, Kuala Lumpur'				
		
		when 6
			listing['description'] = d_board_games.sample

			r = rand(2)
			if ( r == 0)
				listing['longitude'] = 101.62991549999992	
				listing['latitude'] = 3.1349378
				listing['address'] = 'NEXT Academy TTDI Kuala Lumpur'				

			elsif ( r == 1)
				listing['longitude'] = 116.07765399999994 
				listing['latitude'] = 5.983348
				listing['address'] = 'October Cafe KK, Sabah'				

			else
				listing['longitude'] = 101.58986600000003
				listing['latitude'] = 3.0735786
				listing['address'] = 'Meeples Board Game Cafe Subang Jaya, Selangor'				
			end
		
		when 7
			listing['description'] = d_bowling.sample

			r = rand(1)
			if ( r == 0)
				listing['longitude'] = 101.1199828	
				listing['latitude'] = 4.6171713
				listing['address'] = 'Ipoh Bowl Kinta City, Perak'				
			else
				listing['longitude'] = 101.91267870000001
				listing['latitude'] = 2.7008853
				listing['address'] = 'U-Bowl Seremban, Negeri Sembilan'				
			end
		
		when 8
			listing['description'] = d_football.sample
			
			r = rand(1)
			if ( r == 0)
				listing['longitude'] = 102.23101859999997
				listing['latitude'] = 2.2936916
				listing['address'] = 'Jalan Padang Bola Sepak, Melaka'						
			else
				listing['longitude'] = 103.32276630000001
				listing['latitude'] = 3.8148083
				listing['address'] = 'Darul Makmur Stadium'				
			end
		
		else
			puts "aid should be between 1 and 8"
	end

	listing['pax_existing'] = rand(0..15)
	listing['pax_needed'] = rand(1..10)

	listing['date'] = Faker::Date.forward(90)

	start_time = Faker::Time.forward(90)
	listing['starttime'] = start_time
	listing['endtime'] = start_time + [1800, 2700, 3600, 4500, 5400].sample

	Listing.create(listing)

end

# **************** Populating listing and user_listings for demo *****************************

start_time = Faker::Time.forward(90)
Listing.create(description: 'Need 1 more player for our friendly badminton match in PJ area. Just a casual game!',user_id: 1, activity_id: 2, date: Date.today + 1.day, starttime: start_time, endtime: start_time + [1800, 2700, 3600, 4500, 5400].sample, longitude: '101.59009420000007', latitude: '3.15542', address: 'Sunsuria Badminton Court PJ, Selangor')		

UserListing.create(listing_id: 51, user_id: 2, isApproved: 1)
UserListing.create(listing_id: 51, user_id: 3, isApproved: 1)
UserListing.create(listing_id: 51, user_id: 5)
UserListing.create(listing_id: 51, user_id: 6)

puts "End of populating listing and user_listings for demo"

puts "T H E  E N D"