require 'subscribem/constraints/subdomain_required'

Subscribem::Engine.routes.draw do
	
	constraints(Subscribem::Constraints::SubdomainRequired) do
		scope :module => "account" do
			root :to => "dashboard#index"
			get '/sign_in', :to => "sessions#new"
			post '/sign_in', :to => "sessions#create", :as => :sessions
			get '/sign_up', :to => "users#new", :as => :user_sign_up
			post '/sign_up', :to => "users#create", :as => :user_sign_up
<<<<<<< HEAD
=======
			get '/account', :to => "accounts#edit", :as => :edit_account
			put '/account', :to => "accounts#update"
			get '/account/plan/:plan_id', :to => "accounts#plan", :as => :plan_account
<<<<<<< HEAD
>>>>>>> parent of 4f72109... Revert "I'm done with this book....yuck."
=======
>>>>>>> parent of 4f72109... Revert "I'm done with this book....yuck."
		end
	end

	root :to => "dashboard#index"
	get '/sign_up', :to => "accounts#new", :as => :sign_up
	post '/accounts', :to => "accounts#create", :as => :accounts
end
