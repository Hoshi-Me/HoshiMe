class Calculation < ApplicationRecord
  belongs_to :item

  validates :degree_value, presence: true
  validates :start_value, presence: true
  validates :finish_value, presence: true
  validates :price_value, presence: true
  validates :sum, presence: true
end
