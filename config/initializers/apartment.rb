# Apartment Elevator will switch between schemas (search-path) based on the subdomain for a request
# it is mounted between the Rack and the Rails Application that the Subscribem engine is 
# mounted in
Rails.application.config.middleware.use 'Apartment::Elevators::Subdomain'

# This collection includes the models that are not scoped by the schema lookup by the Apartment gem
Apartment.excluded_models = ["Subscribem::Account", 
							"Subscribem::Member",
							"Subscribem::User",
							"Subscribem::Plan"]

# give the Apartment gems a list of the schemas to migrate
# pluck will fetch all the subdomain values for the records in subscribem_accounts				
# and return them in an array.  This array is used by apartment:migrate
Apartment.database_names = lambda{ Subscribem::Account.pluck(:subdomain) }