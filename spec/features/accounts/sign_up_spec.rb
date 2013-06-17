require 'spec_helper'
feature 'Accounts' do
	scenario 'creating an account' do
		visit subscribem.root_url 
		click_link 'Account Sign up'

		fill_in 'Name', :with => 'Test'
		fill_in 'Email', :with => "subscriber@example.com"
		#makes sure Capybara knows which password field to fill in
		password_field_id = "account_owner_attributes_password"
		fill_in 'Password', :with => "password"
		fill_in 'Password confirmation', :with => "password"
		click_button 'Create Account'

		success_message = 'Your account has been successfully created.'
		page.should have_content(success_message)
		page.should have_content("Signed in as subscriber@example.com")
	end
end