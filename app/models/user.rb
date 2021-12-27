class User < ApplicationRecord
  authenticates_with_sorcery!
  # has_many :items, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2, maximum: 15 }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 },      if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true,          if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  before_create -> { self.uuid = SecureRandom.uuid }

  enum role: { guest: 0, admin: 1, general: 2 }

  def self.guest
    random_value = SecureRandom.hex(3)
    find_or_create_by!(name: random_value, email: "guest_#{random_value}@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
    end
  end
end
