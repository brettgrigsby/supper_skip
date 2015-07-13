class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def total
    contents.values.sum
  end

  def total_price
    items.map { |item, quantity| (item.price * quantity).to_f / 100 }.reduce(:+)
  end

  def items
    contents.map do |item_id, quantity|
      [Item.find_by(id: item_id), quantity]
    end
  end

  def clear
    @contents = {}
  end
end

