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
  end

  describe 'create' do
  end
end
