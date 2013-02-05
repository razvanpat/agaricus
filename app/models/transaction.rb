class Transaction < ActiveRecord::Base
  attr_accessible :account_id, :category_id, :entity, :expense, :value, :date
  belongs_to :account, :touch => true
  belongs_to :category, :touch => true

  delegate :user_id, :to => :account

  validates :account_id  , presence: true
  validates :category_id , presence: true
  validates :value , :numericality => { :greater_than => 0 }
  validates :entity , :length => { :maximum => 50 }

  before_create :update_account_balance
  after_save :save_account

  def update_account_balance
    if account != nil
      if expense
        account.balance -= value
      else
        account.balance += value
      end
    end
  end

  def save_account
    self.account.save
  end
end
