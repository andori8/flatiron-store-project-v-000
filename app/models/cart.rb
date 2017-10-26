class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    self.line_items.each do |line_item|
      total += (line_item.quantity * line_item.item.price)
    end
    total
  end
end
