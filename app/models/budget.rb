class Budget < ActiveRecord::Base
  attr_accessible :category_id, :month, :value, :year
  
  before_save :remove_budgets_for_same_month

  def remove_budgets_for_same_month
    Budget.delete_all(["month = ? AND year = ? and category_id = ?", self.month, self.year, self.category_id])
  end
end
