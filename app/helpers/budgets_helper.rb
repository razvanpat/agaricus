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
    #TODO: Use sum here
    transactions = Transaction.where('category_id = ? AND date >= ? AND date < ? AND expense = ?', category_id, @start_time, @end_time, true)
    spendings = 0
    transactions.each do |t|
      spendings += t.value
    end
    return spendings
  end

  def remaining_for_month (category_id, month, year)
    return budget_for_month(category_id, month, year) - spendings_for_month(category_id, month, year)
  end

  def money_budgeted_message
    unbudgeted_amount = accounts_total - remaining_for_current_month
    logger.debug "Unbudgeted amount: " + unbudgeted_amount.to_s
    if unbudgeted_amount > 0
      "<div class=\"yellow\">You have #{unbudgeted_amount} not budgeted.</div>"
    elsif unbudgeted_amount < 0
      unbudgeted_amount = 0 - unbudgeted_amount
      "<div class=\"red\">You need #{unbudgeted_amount} more to cover your budgets.</div>"
    else
      "<div class=\"green\">All money is budgeted. Well done.</div>"
    end
  end

  def accounts_total
    Account.sum(:balance, :conditions => {:user_id => current_user.id})
  end

  def remaining_for_current_month
    @current_month_start = Time.parse("#{@time.year}-#{@time.month}-1")
    @current_month_end = @current_month_start + 1.month
    budgeted = Budget.joins(:category).sum(:value, :conditions => {:month => @time.month, :year => @time.year, :categories => {:user_id => current_user.id}})
    expenses = Transaction.joins(:category).sum(:value, :conditions => {
      :date => [@current_month_start..@current_month_end], 
      :expense => true,
      :categories => {:user_id => current_user.id}})
    result = budgeted - expenses
    logger.debug "Calculating remaining money for this month:"
    logger.debug "  budgeted - " + budgeted.to_s
    logger.debug "  expenses - " + expenses.to_s
    logger.debug "  result   - " + result.to_s
    return result
  end
end
