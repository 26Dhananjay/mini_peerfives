
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :p5_balance, default: 100
      t.integer :reward_balance, default: 0

      t.timestamps
    end
  end
end