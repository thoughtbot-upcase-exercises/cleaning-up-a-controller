class ApprovedExpensesController < ApplicationController
  def update
    user = User.find(params[:user_id])
    @expense = Expense.find(params[:id])
    @expense.update_attributes!(approved: true)

    redirect_to user_expense_path(user, @expense)
  end
end
