require 'spec_helper'

describe Expense do
  describe ".not_deleted" do
    it "finds undeleted items" do
      not_deleted = create(:expense, deleted: false)

      expect(Expense.not_deleted).to eq [not_deleted]
    end

    it "does not find deleted items" do
      create(:expense, deleted: true)

      expect(Expense.not_deleted).to eq []
    end
  end
end
