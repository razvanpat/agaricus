class Transaction < ActiveRecord::Base
  attr_accessible :account_id, :category_id, :entity, :expense, :value, :date
  belongs_to :account, :touch => true
  belongs_to :category, :touch => true

  validates :account_id  , presence: true
  validates :category_id , presence: true

  after_save :update_account_balance

  def update_account_balance
    if self.expense
      self.account.balance -= self.value
      self.account.save
    else
      self.account.balance += self.value
      self.account.save
    end
  end
end
