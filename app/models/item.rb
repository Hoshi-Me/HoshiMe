class Item < ApplicationRecord
  belongs_to :user
  has_one :calculation, dependent: :destroy

  validates :name, presence: true
  validates :degree, presence: true
  validates :start_date, presence: true
  validates :finish_date, presence: true
  validates :price, presence: true
end
