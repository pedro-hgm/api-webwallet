class Account < ApplicationRecord
  belongs_to :user
  has_many :incomes, :dependent => :delete_all
  has_many :expenses, :dependent => :delete_all
  has_and_belongs_to_many :cycle
  validates :name, :balance, :kind, presence: true
end
