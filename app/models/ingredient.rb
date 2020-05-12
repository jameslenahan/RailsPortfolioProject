class Ingredient < ApplicationRecord
  has_many :recipes
  validates :name, presence: true
end