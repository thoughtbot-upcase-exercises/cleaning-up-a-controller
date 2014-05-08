class ExpensesController < ApplicationController
  def index
    user = User.find(params[:user_id])

    if params[:approved].nil?
      @expenses = Expense.where(user: user)
    else
      @expenses = Expense.where(user: user, approved: params[:approved])
    end

    if !params[:min_amount].nil?
      @expenses = @expenses.where('amount > ?', params[:min_amount])
    end

    if !params[:max_amount].nil?
      @expenses = @expenses.where('amount < ?', params[:max_amount])
    end
  end

  def create
    user = User.find(params[:user_id])

    @expense = user.expenses.new(expense_params)

    if @expense.save
      redirect_to user_expenses_path(user)
    end
  end

  def update
  end

  def destroy
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
