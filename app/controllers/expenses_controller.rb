class ExpensesController < ApplicationController
  def index
    user = User.find(params[:user_id])
    expenses = Expense.where(user: user)

    render json: expenses
  end

  def create
  end

  def update
  end

  def destroy
  end
end
