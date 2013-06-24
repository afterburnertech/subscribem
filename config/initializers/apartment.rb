#Apartment Elevator will switch between schemas (search-path) based on the subdomain for a request
#it is mounted between the Rack and the Rails Application that the Subscribem engine is 
#mounted in
Rails.application.config.middleware.use 'Apartment::Elevators::Subdomain'

Apartment.excluded_models = ["Subscribem::Account", 
							"Subscribem::Member",
							"Subscribem::User"]