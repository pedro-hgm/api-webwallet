class CreateJoinTableAccountsCycles < ActiveRecord::Migration[5.2]
  def change
    create_join_table :accounts, :cycles do |t|
      t.index [:account_id, :cycle_id]
      t.index [:cycle_id, :account_id]
    end
  end
end
