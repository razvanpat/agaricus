class Account < ActiveRecord::Base
  attr_accessible :balance, :name
  validates :name, :presence => true, :length => { maximum: 50 }
  validates :balance, :presence => true, :numericality => true

  has_many :transactions, :dependent => :destroy

  belongs_to :user
end
