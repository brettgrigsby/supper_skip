class Restaurant < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :slug, uniqueness: true

  belongs_to :user
  has_many :items
  has_many :categories
  has_many :orders
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :users, through: :user_roles

  def to_param
    slug
  end
end
