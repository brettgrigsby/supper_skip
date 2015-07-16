class User < ActiveRecord::Base
  before_save { self.email == email.downcase }
  before_create :create_remember_token

  validates :first_name, presence: true
  validates :last_name, presence: true, allow_blank: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }
  validates :username,
            allow_blank: true,
            length: {
              in: 2..32,
              too_short: 'Username is too short.',
              too_long: 'Username is too long.'
            }

  has_many :orders
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :restaurants

  def full_name
    "#{first_name} #{last_name}"
  end

  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def name
    username || full_name
  end

  def basket
    orders.where(status: "basket")
  end

  def admin?
    roles.pluck(:title).include?("admin")
  end

  def staff?
    roles.pluck(:title).include?("cook" || "delivery")
  end

  def jobs
    user_roles.map do |user_role|
      restaurant = Restaurant.find(user_role.restaurant_id) if user_role.restaurant_id
      role = Role.find(user_role.role_id).title
      if role == 'cook'
        orders = restaurant.orders.with_ready_for_prep_state + restaurant.orders.with_in_preparation_state
      elsif role == 'delivery'
        orders = restaurant.orders.with_ready_for_delivery_state + restaurant.orders.with_out_for_delivery_state
      end
      if user_role.restaurant_id
      	[role, orders]
      else
        nil
      end
    end - [nil]
  end

  private

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end

end
