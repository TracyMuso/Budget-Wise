class Group < ApplicationRecord
  belongs_to :user
  has_many :group_categories
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :icon, presence: true
end
