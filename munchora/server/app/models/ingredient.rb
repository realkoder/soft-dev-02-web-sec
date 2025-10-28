class Ingredient < ApplicationRecord
  belongs_to :recipe

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0, less_than: 10_000 }
  validates :category, presence: true, inclusion: { in: GroceryCategories::CATEGORIES }
end
