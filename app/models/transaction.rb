class Transaction < ActiveRecord::Base
  attr_accessible :account_id, :category_id, :entity, :expense, :value

  validates :account_id  , presence: true
  validates :category_id , presence: true
end
