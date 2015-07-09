class Restaurant < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  belongs_to :user
  has_many :items
  has_many :categories

  def to_param
    slug
  end
end
