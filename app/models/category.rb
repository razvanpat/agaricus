class Category < ActiveRecord::Base
  attr_accessible :balance, :name
  has_many :transactions
end
