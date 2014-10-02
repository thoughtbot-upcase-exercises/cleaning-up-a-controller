class ExpensesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @expenses = ExpenseFinder.new(@user.expenses).
      approved_filter(params[:approved]).
      min_amount_filter(params[:min_amount]).
      max_amount_filter(params[:max_amount]).
      find
  end

  def new
    @user = User.find(params[:user_id])
    @expense = Expense.new
  end

  def create
    user = User.find(params[:user_id])

    @expense = user.expenses.new(expense_params)

    if @expense.save
      email_body = "#{@expense.name} by #{user.full_name} needs to be approved"
      mailer = ExpenseMailer.new(address: 'admin@expensr.com', body: email_body)
      mailer.deliver

      redirect_to user_expenses_path(user)
    else
      render :new, status: :bad_request
    end
  end

  def update
    user = User.find(params[:user_id])
    @expense = user.expenses.find(params[:id])

    if !@expense.approved?
      @expense.update_attributes!(expense_params)
      flash[:notice] = 'Your expense has been successfully updated'
      redirect_to user_expenses_path(user)
    else
      flash[:error] = 'You cannot update an approved expense'
      render :edit
    end
  end

  def destroy
    user = User.find(params[:user_id])
    expense = user.expenses.find(params[:id])
    expense.update_attributes!(deleted: true)

    redirect_to user_expenses_path(user)
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :approved)
  end
end
