class BudgetsController < ApplicationController
  before_filter :authenticate_user!

  # GET /budget
  # GET /budgets.json
  def index
    @time = Time.new
    @prev_time = @time - 1.month
    @next_time = @time + 1.month
    @months = [@prev_time, @time, @next_time]
    @month_time_format = "%B %Y"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @budgets }
    end
  end

  # GET /budgets/new
  # GET /budgets/new.json
  def new
    @budget = Budget.new
    @budget.year = Time.new.year

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @budget }
    end
  end

  # POST /budgets
  # POST /budgets.json
  def create
    @budget = Budget.new(params[:budget])

    respond_to do |format|
      if @budget.save
        format.html { redirect_to budgets_path }
        format.json { render json: @budget, status: :created, location: @budget }
      else
        format.html { render action: "new" }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

end
