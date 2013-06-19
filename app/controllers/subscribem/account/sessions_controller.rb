require_dependency "subscribem/application_controller"

module Subscribem
  class Account::SessionsController < Subscribem::ApplicationController
  	def new 
  		@user = User.new
  	end

  	def create
  		#the authenticate method is defined in:
  		#/config/initializers/warden/strategies/password.rb
  		if env['warden'].authenticate(:scope => :user)
  			flash[:notice] = "You are now signed in"
  			redirect_to root_path
  		end
  	end
  end
end
