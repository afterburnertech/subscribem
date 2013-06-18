module Subscribem
  class Engine < ::Rails::Engine
    isolate_namespace Subscribem
    require "warden"
    require "dynamic_form"
    config.middleware.use Warden::Manager
    
    #make our engine always user RSpec instead of typical unit tests
    config.generators do |g|
    	g.test_framework :rspec, :view_specs => false
    end
  end
end
