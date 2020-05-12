class Recipe < ApplicationRecord
  has_many :ingredients
  belongs_to :user
  validates :name, presence: true

  def self.order_by_ingredients
    Recipe.all.sort { |a, b| b.ingredients.count <=> a.ingredients.count }
  end
end