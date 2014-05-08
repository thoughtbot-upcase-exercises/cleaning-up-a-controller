class ExpensesController < ApplicationController
  def index
    user = User.find(params[:user_id])

    if params[:approved].nil?
      expenses = Expense.where(user: user)
    else
      expenses = Expense.where(user: user, approved: params[:approved])
    end

    render json: expenses
  end

  def create
  end

  def update
  end

  def destroy
  end
end
