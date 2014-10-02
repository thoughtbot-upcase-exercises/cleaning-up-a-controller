require "spec_helper"

describe ExpenseFinder do
  before do
    @user = create(:user)
  end

  it "finds expenses that are not deleted" do
    undeleted = create(:expense, user: @user, deleted: false)
    deleted = create(:expense, user: @user, deleted: true)
    finder = ExpenseFinder.new(@user.expenses)

    expect(finder.find).to eq [undeleted]
  end

  it "can filter for unapproved expenses" do
    unapproved = create(:expense, :unapproved, user: @user)
    approved = create(:expense, :approved, user: @user)
    finder = ExpenseFinder.new(@user.expenses)
    finder.approved_filter(false)

    expect(finder.find).to eq [unapproved]
  end

  it "can filter for approved expenses" do
    unapproved = create(:expense, :unapproved, user: @user)
    approved = create(:expense, :approved, user: @user)
    finder = ExpenseFinder.new(@user.expenses)
    finder.approved_filter(true)

    expect(finder.find).to eq [approved]
  end

  it "can filter by min_amount" do
    less = create(:expense, user: @user, amount: 40)
    greater = create(:expense, user: @user, amount: 100)
    finder = ExpenseFinder.new(@user.expenses)
    finder.min_amount_filter(80)

    expect(finder.find).to eq [greater]
  end

  it "can filter by max_amount" do
    less = create(:expense, user: @user, amount: 40)
    greater = create(:expense, user: @user, amount: 100)
    finder = ExpenseFinder.new(@user.expenses)
    finder.max_amount_filter(80)

    expect(finder.find).to eq [less]
  end
end
