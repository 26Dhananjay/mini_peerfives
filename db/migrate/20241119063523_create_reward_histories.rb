
class CreateRewardHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :reward_histories do |t|
      t.datetime :datetime, null: false
      t.integer :points, null: false
      t.integer :given_by, null: false
      t.integer :given_to, null: false

      t.timestamps
    end
  end
end