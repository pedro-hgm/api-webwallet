class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.decimal :value
      t.integer :month
      t.text :description
      t.references :category, foreign_key: true
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
