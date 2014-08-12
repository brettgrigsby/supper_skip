class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  # :allow_blank => true
  validates :username, allow_blank: true, length: {
                                            in: 2..32,
                                            too_short: 'Username is too short.',
                                            too_long: 'Username is too long.'
                                          }
end
