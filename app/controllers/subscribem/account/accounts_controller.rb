require_dependency "subscribem/application_controller"

module Subscribem
  class Account::AccountsController < ApplicationController
  	before_filter :authenticate_user!
  	before_filter :authorize_owner, :only => [:edit, :update]

  	def update
  		plan_id = params[:account].delete(:plan_id)
  		if current_account.update_attributes(params[:account])
  			flash[:success] = "Account updated successfully."
  			if plan_id != current_account.plan_id
				redirect_to plan_account_url(:plan_id => plan_id) and return			
  			end
  			redirect_to root_path
  		else
  			flash[:error] = "Account could not be updated."
  			render :edit
  		end
  	end
  end
end
