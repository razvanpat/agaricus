class Account < ActiveRecord::Base
  attr_accessible :balance, :name
  has_many :transactions, :dependent => :destroy
end
