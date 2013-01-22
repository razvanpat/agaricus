class Category < ActiveRecord::Base
  attr_accessible :balance, :name

  has_many :transactions
  has_many :budgets
end
