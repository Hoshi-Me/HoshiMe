class Item < ApplicationRecord
  validates :name, presence: true
  validates :degree, presence: true
  validates :start_date, presence: true
  validates :finish_date, presence: true
  validates :price, presence: true
end
