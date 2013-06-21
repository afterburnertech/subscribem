class Thing < ActiveRecord::Base
  attr_accessible :account, :name
  belongs_to :account, :class_name => "Subscribem::Account"

end
