class Category < ActiveRecord::Base
  validates :name, presence: true

  has_many :categorizations
  has_many :items, through: :categorizations
  belongs_to :restaurant

  scope :main_categories, -> {  where(name: %w(Breakfast Appetizers Lunch Dinner Dessert)) }
  scope :special_categories, -> { where.not(name: %w(Breakfast Appetizers Lunch Dinner Dessert)) }
end
