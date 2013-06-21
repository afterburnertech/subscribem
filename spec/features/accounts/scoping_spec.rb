require 'spec_helper'
require 'subscribem/testing_support/authentication_helpers'
require 'subscribem/testing_support/factories/account_factory'
require 'subscribem/testing_support/factories/user_factory'

feature "Account scoping" do 
	include Subscribem::TestingSupport::AuthenticationHelpers
	let!(:account_a) { FactoryGirl.create(:account) }
	let!(:account_b) { FactoryGirl.create(:account) }
	before do
		Thing.create(:name => "Account A's Thing", :account => account_a)
		Thing.create(:name => "Account B's Thing", :account => account_b)
	end
	scenario "displays only account A's records" do
		sign_in_as(:user => account_a.owner, :account => account_a)
		visit '/things'
		page.should have_content("Account A's Thing")
		page.should_not have_content("Account B's Thing")
	end
	scenario "display only B's records" do
		sign_in_as(:user => account_b.owner, :account => account_b)
		visit '/things'
		page.should have_content("Account B's Thing")
		page.should_not have_content("Account A's Thing")
	end
end