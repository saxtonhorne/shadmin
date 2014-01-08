FactoryGirl.define do
	factory :admin, class: 'Shadmin::Admin' do
		email 'test@example.com'
		password 'password123'
		password_confirmation 'password123'
	end
end