class TransactionsController < ApplicationController
  before_filter :authenticate_user!

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.joins(:category).where('categories.user_id = ?', current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transactions }
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    @transaction = Transaction.find(params[:id])

    if @transaction.category.user == current_user
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @transaction }
      end
    else 
      raise_not_found
    end
  end

  # GET /transactions/new
  # GET /transactions/new.json
  def new
    @transaction = Transaction.new

    session[:transaction_return] = "general"
    if params[:category_id]
      @transaction.category_id = params[:category_id]
      session[:transaction_return] = "categories"
    end
    if params[:account_id]
      @transaction.account_id = params[:account_id]
      session[:transaction_return] = "accounts"
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:id])
    if @transaction.category.user != current_user
      raise_not_found
    end
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(params[:transaction])

    respond_to do |format|
      if @transaction.save
        format.html do 
          if session[:transaction_return] == "general"
            redirect_to new_transaction_url, notice: 'Transaction was successfully created.'
          elsif session[:transaction_return] == "categories"
            redirect_to categories_url, notice: 'Transaction was successfully created.'
          elsif session[:transaction_return] == "accounts"
            redirect_to accounts_url, notice: 'Transaction was successfully created.'
          end
        end
        format.json { render json: @transaction, status: :created, location: @transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transactions/1
  # PUT /transactions/1.json
  def update
    @transaction = Transaction.find(params[:id])

    if @transaction.category.user == current_user
      respond_to do |format|
        if @transaction.update_attributes(params[:transaction])
          format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @transaction.errors, status: :unprocessable_entity }
        end
      end
    else
      raise_not_found
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction = Transaction.find(params[:id])

    if @transaction.category.user == current_user
      @transaction.destroy

      respond_to do |format|
        format.html { redirect_to transactions_url }
        format.json { head :no_content }
      end
    else
      raise_not_found
    end
  end
end
