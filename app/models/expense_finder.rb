class ExpenseFinder
  def initialize(scope, approved: nil, min_amount: nil, max_amount: nil)
    @scope = scope.where(deleted: false)
    @approved = approved
    @min_amount = min_amount
    @max_amount = max_amount
  end

  def find
    new_scope = approved_filter(@scope)
    new_scope = min_amount_filter(new_scope)
    new_scope = max_amount_filter(new_scope)
  end

  private

  def min_amount_filter(scope)
    if @min_amount.nil?
      scope
    else
      scope.where("amount > ?", @min_amount)
    end
  end

  def max_amount_filter(scope)
    if @max_amount.nil?
      scope
    else
      scope.where("amount < ?", @max_amount)
    end
  end

  def approved_filter(scope)
    if @approved.nil?
      scope
    else
      @scope.where(approved: @approved)
    end
  end
end
