class Budget < ActiveRecord::Base
  attr_accessible :category_id, :month, :value, :year
  
  belongs_to :category
  
  delegate :user_id, :to => :category

  validates :month, :numericality => { :greater_than => 0, :less_than => 13 } 
  validates :year, :numericality => { :greater_than => 0 }
  validates :value, :numericality => { :greater_than_or_equal_to => 0 }

  before_save :remove_budgets_for_same_month

  def remove_budgets_for_same_month
    Budget.delete_all(["month = ? AND year = ? and category_id = ?", self.month, self.year, self.category_id])
  end
end
