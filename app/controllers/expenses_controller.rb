class ExpensesController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    if params[:approved].nil?
      @expenses = Expense.where(user: @user, deleted: false)
    else
      @expenses = Expense.where(user: @user, approved: params[:approved], deleted: false)
    end

    if !params[:min_amount].nil?
      @expenses = @expenses.where('amount > ?', params[:min_amount])
    end

    if !params[:max_amount].nil?
      @expenses = @expenses.where('amount < ?', params[:max_amount])
    end
  end

  def new
    @user = User.find(params[:user_id])
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

    if !@expense.approved
      @expense.update_attributes!(expense_params)
      flash[:notice] = 'Your expense has been successfully updated'
      redirect_to user_expenses_path(user_id: user.id)
    else
      flash[:error] = 'You cannot update an approved expense'
      render :edit
    end
  end

  def approve
    @expense = Expense.find(params[:expense_id])
    @expense.update_attributes!(approved: true)

    render :show
  end

  def destroy
    expense = Expense.find(params[:id])
    expense.update_attributes!(deleted: true)

    render :index
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :approved)
  end
end
