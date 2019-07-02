class CreateCycles < ActiveRecord::Migration[5.2]
  def change
    create_table :cycles do |t|
      t.integer :year
      t.integer :month
      t.references :user, foreign_key: true
      # t.references :account, foreign_key: true
      t.boolean :current, null: false, default: false

      t.timestamps
    end
  end
end
