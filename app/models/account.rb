class Account < ActiveRecord::Base
  attr_accessible :balance, :name
  validates :name, :presence => true
  validates :name, :length => { maximum: 50 }
  validates :balance, :presence => true
  validates :balance, :numericality => true

  has_many :transactions, :dependent => :destroy

  belongs_to :user
end
