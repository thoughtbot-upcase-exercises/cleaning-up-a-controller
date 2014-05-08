require 'spec_helper'


describe ExpensesController do
  before do
    @user = create(:user)
  end

  it 'something' do
    expense = create(:expense, user: @user)

    get :index, user_id: @user.id

    expect(response.body).to eq [expense].to_json
  end
end
