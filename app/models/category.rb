class Category < ApplicationRecord
  belongs_to :user
  has_many :groups_categories

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
