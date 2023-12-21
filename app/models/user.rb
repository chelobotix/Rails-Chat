class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 50 }

  has_many :messages, dependent: :destroy

  before_save :username_lowercase

  # username_lowercase
  def username_lowercase
    self.username = username.downcase
  end

  has_secure_password
end
