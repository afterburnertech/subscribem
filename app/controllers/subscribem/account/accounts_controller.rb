require_dependency "subscribem/application_controller"

module Subscribem
  class Account::AccountsController < ApplicationController
  	def update
  		if current_account.update_attributes(params[:account])
  			flash[:success] = "Account updated successfully."
  			redirect_to root_path
  		end
  	end
  end
end
