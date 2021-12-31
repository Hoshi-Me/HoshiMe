class Item < ApplicationRecord
  belongs_to :user
  has_one :calculation, dependent: :destroy

  validates :name, presence: true
  validates :degree, presence: true
  validates :start_date, presence: true
  validates :finish_date, presence: true
  validates :price, presence: true

  def calculate
    calculate_item = self
    calculate = calculate_item.build_calculation
    calculate.degree_value = calculate_degree(calculate_item.degree)
    calculate.start_value = calculate_start(calculate_item.start_date)
    calculate.finish_value = calculate_finish(calculate_item.finish_date)
    calculate.price_value = calculate_price(calculate_item.price)
    calculate.sum = calculate.degree_value + calculate.start_value + calculate.finish_value + calculate.price_value
    calculate.save!
  end

  def calculate_degree(data)
    case data
    when 0..20
      degree_value = 2
    when 21..40
      degree_value = 4
    when 41..60
      degree_value = 6
    when 61..80
      degree_value = 8
    when 81..100
      degree_value = 10
    end
    degree_value * 0.4
  end

  def calculate_start(data)
    case data
    when 0..30
      start_value = 2
    when 31..90
      start_value = 4
    when 91..180
      start_value = 6
    when 181..365
      start_value = 8
    when 365..nil
      start_value = 10
    end
    start_value * 0.6
  end

  def calculate_finish(data)
    case data
    when 0..30
      finish_value = 10
    when 31..90
      finish_value = 8
    when 91..180
      finish_value = 6
    when 181..365
      finish_value = 4
    when 365..nil
      finish_value = 2
    end
    finish_value * 0.8
  end

  def calculate_price(data)
    case data
    when 0..10_000
      price_value = 10
    when 10_001..25_000
      price_value = 8
    when 25_001..50_000
      price_value = 6
    when 50_001..100_000
      price_value = 4
    when 100_000..nil
      price_value = 2
    end
    price_value * 0.2
  end
end
