class User < ApplicationRecord
  authenticates_with_sorcery!
  # has_many :items, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2, maximum: 15 }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 },      if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true,          if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  before_create -> { self.uuid = SecureRandom.uuid }

  def self.guest
    random_value = SecureRandom.hex
    user = User.create!( name: random_value, email: "guest_#{random_value}@example.com" )
    user.password = SecureRandom.urlsafe_base64
    user.password_confirmation = user.password
    user.name = 'ゲスト'
    auto_login(user)
    redirect_to new_three_item_path
  end
end
