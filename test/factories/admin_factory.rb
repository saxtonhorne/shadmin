FactoryGirl.define do
	factory :admin, class: 'Shadmin::Admin' do
		sequence(:email)  { |n| "adam_#{n}@example.com" }
		password 'password123'
		password_confirmation 'password123'

		factory :admin_adam do
			email 'adam@example.com'
		end
	end
end