class Group < ApplicationRecord
  belongs_to :user
  has_many :group_categories, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true

  ICONS = %i[ airplane-take-off birthday-cake clothes-hanger dog-face finance fuel-tank gift gold-stack groceries
  house line-graph plants sneakers travel wifi ].freeze
end
