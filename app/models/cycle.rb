class Cycle < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :accounts
  validates :year, :month, presence: true
end
