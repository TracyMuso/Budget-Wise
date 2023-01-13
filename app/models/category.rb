class Category < ApplicationRecord
  belongs_to :user
  has_many :group_categories
  has_and_belongs_to_many :groups

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
