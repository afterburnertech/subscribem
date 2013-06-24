require 'spec_helper'
describe Subscribem::AccountsController do 
	context "creates the account's schema" do
		let!(:account) { stub_model(Subscribem::Account) }
		before do
			#only want to ensure that the controller calls create_with_owner
			Subscribem::Account.should_receive(:create_with_owner).
			and_return(account)
			#we don't need the validations to run at this point
			account.stub :valid? => true
			controller.stub(:force_authentication!)
		end
		specify do
			account.should_receive(:create_schema)
			#specify the route otherwise the test will attempt to find the route
			#within the dummy app rather than the engine
			post :create, :account => { :name => "First Account" }, :use_route => :subscribem
		end
	end
end
