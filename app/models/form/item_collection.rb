class Form::ItemCollection < Form::Base
  FORM_COUNT = 3
  attr_accessor :items

  def initialize(attributes = {})
    super attributes
    self.items = FORM_COUNT.times.map { Item.new() } unless self.items.present?
  end

  def items_attributes=(attributes)
    self.items = attributes.map { |_, v| Item.new(v) }
  end

  def save
    # 3件全て保存できた場合のみ実行する
    Item.transaction do
      self.items.map(&:save!)
    end
      return true
    rescue => e
      return false
  end
end
