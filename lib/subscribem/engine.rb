module Subscribem
  class Engine < ::Rails::Engine
    isolate_namespace Subscribem

    #make our engine always user RSpec instead of typical unit tests
    config.generators do |g|
    	g.test_framework :rspec, :view_specs => false
    end
  end
end
