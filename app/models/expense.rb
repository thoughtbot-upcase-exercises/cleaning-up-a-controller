class Expense < ActiveRecord::Base
  belongs_to :user

  validates :amount, presence: true

  def self.not_deleted
    where(deleted: false)
  end
end
