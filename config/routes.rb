require 'subscribem/constraints/subdomain_required'

Subscribem::Engine.routes.draw do
	
	constraints(Subscribem::Constraints::SubdomainRequired) do
		scope :module => "account" do
			root :to => "dashboard#index"
			get '/sign_in', :to => "sessions#new"
			post '/sign_in', :to => "sessions#create", :as => :sessions
			get '/sign_up', :to => "users#new", :as => :user_sign_up
			post '/sign_up', :to => "users#create", :as => :user_sign_up
			get '/account', :to => "accounts#edit", :as => :edit_account
			put '/account', :to => "accounts#update"
		end
	end

	root :to => "dashboard#index"
	get '/sign_up', :to => "accounts#new", :as => :sign_up
	post '/accounts', :to => "accounts#create", :as => :accounts
end
