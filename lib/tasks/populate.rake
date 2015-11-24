namespace :db do

	desc "erase existing db and fill"
	task :populate => :environment do
		require 'populator'
		require 'faker'

		[Friend, Notification, Suggestion, User].each(&:delete_all)
		
		100.times do
			user = User.new
			user.first_name = Faker::Name.first_name
			user.last_name = Faker::Name.last_name
			user.email = Faker::Internet.email
			user.password_digest = Faker::Internet.password(10)
			user.save!
		end

		1000.times do
			suggestion = Suggestion.new
			suggestion.user_id = User.offset(rand(User.count)).first.id
			suggestion.name = Faker::Lorem.sentence(3)
			suggestion.description = Faker::Lorem.paragraph
			suggestion.category = Suggestion::CATEGORIES_LIST[rand(Suggestion::CATEGORIES_LIST.count - 1)].first[1]
			suggestion.experience_type = Suggestion::EXPERIENCE_TYPES[rand(Suggestion::EXPERIENCE_TYPES.count - 1)].first[1]
			suggestion.location = Faker::Company.name
			suggestion.save!
		end 	
	end
end