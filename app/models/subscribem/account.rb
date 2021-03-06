module Subscribem
  class Account < ActiveRecord::Base
    attr_accessible :name, :subdomain, :owner_attributes, :plan_id
    validates :subdomain, :presence => true, :uniqueness => true
    validates :name, :presence => true

    belongs_to :owner, :class_name => "Subscribem::User"
    accepts_nested_attributes_for :owner

    belongs_to :plan, :class_name => "Subscribem::Plan"

    has_many :members, :class_name => "Subscribem::Member"
    has_many :users, :through => :members

    def create_schema
    	Apartment::Database.create(subdomain)
    end

    def self.create_with_owner(params = {})
    	account = new(params)
    	if account.save
    		account.users << account.owner
    	end
    	account
    end

    def owner?(user)
    	owner == user
    end

  end
end
