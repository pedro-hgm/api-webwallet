class Income < ApplicationRecord
  # belongs_to :category
  belongs_to :account
  belongs_to :user
  validates :year, :month, :day, :value, presence: true
end
