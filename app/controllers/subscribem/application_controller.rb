module Subscribem
  class ApplicationController < ActionController::Base

  	def current_account
  		if user_signed_in?
  			@current_account ||= 
  		end
  	end
  end
end
