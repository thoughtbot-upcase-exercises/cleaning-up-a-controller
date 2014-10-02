require 'spec_helper'

feature 'user manages expense' do
  let(:user) { create(:user) }

  scenario 'views all expenses' do
    expense = create(:expense, :unapproved, user: user, amount: 15.00)
    approved_expense = create(:expense, :approved, user: user, amount: 12.12)
    other_expense = create(:expense, user: create(:user))

    visit user_expenses_path(user_id: user.id)

    within '.expenses' do
      expect(page).to have_content "#{expense.name} $15.00 delete"
      expect(page).to have_content "#{approved_expense.name} $12.12 Approved"
      expect(page).to_not have_content "#{other_expense.name}"
    end
  end

  scenario 'creates an expense' do
    visit new_user_expense_path(user_id: user.id)

    fill_in 'expense_name', with: 'Dinner 5/12/2014'
    fill_in 'expense_amount', with: '50.21'
    click_button 'Save Expense'

    expect(page).to have_content "Dinner 5/12/2014 $50.21"
  end

  scenario 'approve an expense' do
    expense = create(:expense, :unapproved, user: user, amount: 15.00)

    visit user_expenses_path(user_id: user.id)
    click_on "approve"

    visit user_expenses_path(user_id: user.id)
    expect(page).to have_content "#{expense.name} $15.00 Approved"
  end

  scenario 'delete an expense' do
    expense = create(:expense, :unapproved, user: user, amount: 15.00)
    visit user_expenses_path(user_id: user.id)

    click_link 'delete'

    visit user_expenses_path(user_id: user.id)
    expect(page).not_to have_content "#{expense.name} $15.00 Approved"
  end
end
