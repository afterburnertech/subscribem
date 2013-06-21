module Subscribem
  class Engine < ::Rails::Engine
    isolate_namespace Subscribem
    require "warden"
    require "dynamic_form"

    #the to_prepare block runs everytime a new request happens in development
    #it will only run once in prod --while the server is starting up
    config.to_prepare do
    	root = Subscribem::Engine.root
    	extenders_path = root + "app/extenders/**/*.rb"
    	Dir.glob(extenders_path) do |file|
    		Rails.configuration.cache_classes ? require(file) : load(file)
    	end
    end

    #moved this to config/initializers/warden.rb to add the middleware
    #to the application stack
    #config.middleware.use Warden::Manager do |manager|
    #	manager.default_strategies :password
    #end
    
    #make our engine always user RSpec instead of typical unit tests
    config.generators do |g|
    	g.test_framework :rspec, :view_specs => false
    end
  end
end
