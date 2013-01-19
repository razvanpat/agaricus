class Transaction < ActiveRecord::Base
  attr_accessible :account_id, :category_id, :entity, :expense, :value
end
