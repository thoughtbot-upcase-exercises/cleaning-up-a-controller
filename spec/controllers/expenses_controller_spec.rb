require 'spec_helper'

describe ExpensesController do
  before do
    @user = create(:user)
  end

  describe 'index' do
    it 'returns all expenses' do
      expense = create(:expense, user: @user)

      get :index, user_id: @user.id

      expect(assigns(:expenses)). to eq [expense]
    end

    context 'filtering' do
      it 'returns only pending expenses' do
        pending_expense = create(:expense, user: @user)
        approved_expense = create(:expense, :approved, user: @user)

        get :index, user_id: @user.id, approved: false

        expect(assigns(:expenses)).to eq [pending_expense]
      end

      it 'returns only approved expenses' do
        pending_expense = create(:expense, user: @user)
        approved_expense = create(:expense, :approved, user: @user)

        get :index, user_id: @user.id, approved: true

        expect(assigns(:expenses)).to eq [approved_expense]
      end

      it 'filters expenses by min amount' do
        matching_expense = create(:expense, user: @user, amount: 14.00)
        other_matching_expense = create(:expense, user: @user, amount: 15.21)
        not_matching_expense = create(:expense, user: @user, amount: 6.00)

        get :index, user_id: @user.id, min_amount: 10

        expect(assigns(:expenses)).to match_array(
          [matching_expense, other_matching_expense]
        )
      end

      it 'filters expenses by max amount' do
        matching_expense = create(:expense, user: @user, amount: 14.00)
        other_matching_expense = create(:expense, user: @user, amount: 14.21)
        not_matching_expense = create(:expense, user: @user, amount: 16.00)

        get :index, user_id: @user.id, max_amount: 15

        expect(assigns(:expenses)).to match_array(
          [matching_expense, other_matching_expense]
        )
      end
    end
  end

  describe 'create' do
    it 'returns created expense for user with correct params' do
      expense = build(:expense)

      post :create, user_id: @user.id, expense: expense.attributes
      created_expense = Expense.find_by(amount: expense.amount, name: expense.name)

      expect(response).to redirect_to(user_expenses_path(@user))
      expect(assigns(:expense)).to eq created_expense
    end

    it 'returns error for expense with no amount' do
      expense = build(:expense, amount: nil)

      post :create, user_id: @user.id, expense: expense.attributes

      expect(response.status).to eq 400
      expect(response.body).to contain('There was an error creating your expense')
    end

    it 'emails admin after creation'
  end
end
