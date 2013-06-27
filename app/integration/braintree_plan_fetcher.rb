class BraintreePlanFetcher
	def self.store_locally
		Braintree::Plan.all.each do |plan|
			if local_plan = Subscribem::Plan.find_by_braintree_id(plan.id)
				local_plan.update_attributes({
					:name => plan.name,
					:amount => plan.price
					})
			else
				Subscribem::Plan.create({
					:name 	=> plan.name,
					:amount	=> plan.price,
					:braintree_id => plan.id
					})
			end
		end
	end
end