module Subscribem
  class Plan < ActiveRecord::Base
    attr_accessible :amount, :braintree_id, :name
  end
end
