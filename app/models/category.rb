class Category < ApplicationRecord
  # belongs_to :group class_name: 'Group', foreign_key: 'group_id'
  has_many :group_categories
  has_many :groups, through: :group_categories

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
