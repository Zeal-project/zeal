namespace :dev do 

	task :demo => :environment do
		puts"demo!"

		puts CareerPost.count
	end	
	
	task :fake => :environment do
		User.delete_all
		CareerPost.delete_all
		Company.delete_all

		puts "Creating fake data!"

		10.times do 
			user = User.create!( :email => Faker::Internet.email, :password => Faker::Internet.password(8))
			10.times do
				career_post = user.career_posts.create!( :title => Faker::Name.name, :content => Faker::Name.name )
			end
		end

		20.times do
			company = Company.create!( :title => Faker::Company.name, :intro => Faker::Company.catch_phrase, :address => Faker::Company.bs )
		end	

	end
end