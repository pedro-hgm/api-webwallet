class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.decimal :value
      t.integer :year
      t.integer :month
      t.integer :day
      t.text :description, default: "No description provided"
      # t.references :category, foreign_key: true
      t.references :account, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
