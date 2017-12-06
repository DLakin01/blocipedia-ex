class User < ApplicationRecord

  # Validations for name
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  # Validations for password
  validates :password, presence: true, length: { minimum: 8}, if: "password_digest.nil?"
  validates :password, length: { minimum: 8 }, allow_blank: true

  # Validations for email
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 6, maximum: 254 }

  has_secure_password

end
