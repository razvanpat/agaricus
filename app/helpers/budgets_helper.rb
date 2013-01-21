module BudgetsHelper
  def budget_for_month (category_id, month, year)
    budget = Budget.where('category_id = ? AND month = ? AND year = ?', category_id, month, year).first
    if budget
      return budget.value
    else
      return 0
    end
  end

  def spendings_for_month (category_id, month, year)
    @start_time = Time.parse("#{year}-#{month}-1")
    @end_time = @start_time + 1.month
    transactions = Transaction.where('category_id = ? AND date >= ? AND date < ?', category_id, @start_time, @end_time)
    spendings = 0
    transactions.each do |t|
      spendings += t.value
    end
    return spendings
  end

  def remaining_for_month (category_id, month, year)
    return budget_for_month(category_id, month, year) - spendings_for_month(category_id, month, year)
  end
end
