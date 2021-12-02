class Form::ItemCollection < Form::Base
  FORM_COUNT = 3
  attr_accessor :items

  def initialize(attributes = {})
    super attributes
    self.items = FORM_COUNT.times.map { Item.new } unless items.present?
  end

  def items_attributes=(attributes)
    self.items = attributes.map { |_, v| Item.new(v) }
  end

  def save
    # 3件全て保存できた場合のみ実行する
    Item.transaction do
      items.map(&:save!)
    end
    true
  rescue StandardError => e
    p e
    false
  end
end
