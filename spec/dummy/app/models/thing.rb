class Thing < ActiveRecord::Base
  attr_accessible :account, :name
  #defined in lib/active_record_extensions
  scoped_to_account

end
