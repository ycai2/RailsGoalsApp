class User < ActiveRecord::Base
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :goals

end
