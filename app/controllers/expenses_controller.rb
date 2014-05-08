class ExpensesController < ApplicationController
  def index
    user = User.find(params[:user_id])

    if params[:approved].nil?
      expenses = Expense.where(user: user)
    else
      expenses = Expense.where(user: user, approved: params[:approved])
    end

    if !params[:min_amount].nil?
      expenses = expenses.where('amount > ?', params[:min_amount])
    end

    if !params[:max_amount].nil?
      expenses = expenses.where('amount < ?', params[:max_amount])
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
