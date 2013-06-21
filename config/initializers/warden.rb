Rails.application.config.middleware.use Warden::Manager do |manager|
	manager.default_strategies :password
end
    
Warden::Strategies.add(:password) do	

	def subdomain
		#the rack gets called before the request
		ActionDispatch::Http::URL.extract_subdomains(request.host, 1)
	end
	def valid?
		subdomain.present? && params["user"]
	end
	def authenticate!
		account = Subscribem::Account.find_by_subdomain(subdomain)
		if account
			u = account.users.find_by_email(params["user"]["email"])
			if u.nil?
				fail!
			else
				u.authenticate(params["user"]["password"]) ? success!(u) : fail!
			end
		else
			fail!
		end
	end
end