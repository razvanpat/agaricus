class Category < ActiveRecord::Base
  attr_accessible :balance, :name

  belongs_to :user

  has_many :transactions
  has_many :budgets
end
