class Restaurant < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  belongs_to :user
  has_many :items
end
