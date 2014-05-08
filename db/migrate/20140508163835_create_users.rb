class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.boolean :admin, default: false, null: false
    end
  end
end
