require 'spec_helper'

describe ExpensesController do
  before do
    @user = create(:user)
  end

  describe 'index' do
    it 'returns all expenses' do
      expense = create(:expense, user: @user)

      get :index, user_id: @user.id

      expect(response.body).to eq [expense].to_json
    end

    it 'returns only pending expenses' do
      pending_expense = create(:expense, user: @user)
      approved_expense = create(:expense, :approved, user: @user)

      get :index, user_id: @user.id, approved: false

      expect(response.body).to eq [pending_expense].to_json
    end

    it 'returns only approved expenses' do
      pending_expense = create(:expense, user: @user)
      approved_expense = create(:expense, :approved, user: @user)

      get :index, user_id: @user.id, approved: true

      expect(response.body).to eq [approved_expense].to_json
    end

    it 'filters expenses by min amount' do
      matching_expense = create(:expense, user: @user, amount: 14.00)
      other_matching_expense = create(:expense, user: @user, amount: 15.21)
      not_matching_expense = create(:expense, user: @user, amount: 6.00)

      get :index, user_id: @user.id, min_amount: 10

      expect(response.body).to eq(
        [matching_expense, other_matching_expense].to_json
      )
    end

    it 'filters expenses by max amount' do
      matching_expense = create(:expense, user: @user, amount: 14.00)
      other_matching_expense = create(:expense, user: @user, amount: 14.21)
      not_matching_expense = create(:expense, user: @user, amount: 16.00)

      get :index, user_id: @user.id, max_amount: 15

      expect(response.body).to eq(
        [matching_expense, other_matching_expense].to_json
      )
    end
  end
end
