require 'spec_helper'

describe ApprovedExpensesController do
  before do
    @user = create(:user)
  end

  describe 'create' do
    it 'approves an unapproved expense' do
      expense = create(:expense, :unapproved, user: @user)

      patch :update, id: expense.id, user_id: @user.id

      expect(response).to redirect_to user_expense_path(@user, expense)
      expect(Expense.find(expense.id).approved?).to be_true
    end
  end
end
