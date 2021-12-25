class Form::ItemCollection < Form::Base
  FORM_COUNT = 3
  attr_accessor :items
  attr_accessor :user_id

  def initialize(attributes = {})
    super attributes
    self.items = FORM_COUNT.times.map { Item.new } unless items.present?
  end

  def items_attributes=(attributes)
    self.items = attributes.map { |_, v| Item.new(v) }
    #current_user.self.items.build
    #self.items.each do |i|
      #i.user_id = current_user.id
    #end
  end

  def save
    # 3件全て保存できた場合のみ実行する
    Item.transaction do
      items.map(&:save!)
      items.map(&:calculation)
    end
    true
  rescue StandardError => e
    p e
    false
  end
end
