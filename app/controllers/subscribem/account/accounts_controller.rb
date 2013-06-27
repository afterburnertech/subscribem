require_dependency "subscribem/application_controller"

module Subscribem
  class Account::AccountsController < ApplicationController
  	before_filter :authenticate_user!
  	before_filter :authorize_owner, :only => [:edit, :update]

  	def update
  		if current_account.update_attributes(params[:account])
  			flash[:success] = "Account updated successfully."
  			if current_account.previous_changes.include?("plan_id")
  				plan = current_account.plan
  				flash[:success] += " You are now on the '#{plan.name}' plan."
  			end
  			redirect_to root_path
  		else
  			flash[:error] = "Account could not be updated."
  			render :edit
  		end
  	end
  end
end
