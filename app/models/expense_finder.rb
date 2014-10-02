class ExpenseFinder
  def initialize(expenses_scope)
    @scope = expenses_scope.not_deleted
  end

  def find
    @scope
  end

  def approved_filter(approved)
    unless approved.nil?
      @scope = @scope.where(approved: approved)
    end
    self
  end

  def min_amount_filter(min_amount)
    unless min_amount.nil?
      @scope = @scope.where("amount > ?", min_amount)
    end
    self
  end

  def max_amount_filter(max_amount)
    unless max_amount.nil?
      @scope = @scope.where("amount < ?", max_amount)
    end
    self
  end
end
