class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.decimal :amount, null: false
      t.boolean :approved, default: false, null: false
      t.boolean :deleted, default: false, null: false
      t.string :name, null: false
      t.references :user, index: true

      t.timestamps
    end

  end
end
