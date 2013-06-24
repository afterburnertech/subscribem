#by nesting account_with_schema w/i account we can create an account with
#a schema or w/o
FactoryGirl.define do
	factory :account, :class => Subscribem::Account do
		sequence(:name) { |n| "Test Account ##{n}" }
		sequence(:subdomain) { |n| "test#{n}"}
		association :owner, :factory => :user
		after(:create) do |account|
			account.users << account.owner
		end
		factory :account_with_schema do
			after(:create) do |account| 
				account.create_schema
			end
		end
	end
end