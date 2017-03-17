def update_quality(items)
  items.each do |item|
    start(item)
  end
end

private
def start(item)
  validate_name(item) && quality_greater_than_zero(item) || validate_increment_quality(item)
  item.name != 'Sulfuras, Hand of Ragnaros' &&  item.sell_in -= 1
  item.sell_in < 0 && change_value_quality(item)
end

def validate_name(item)
  item.name == 'NORMAL ITEM' || item.name == 'Sulfuras, Hand of Ragnaros'
end

def quality_greater_than_zero(item)
  item.quality > 0 && reduce_quality(item)
end

def reduce_quality(item)
  item.name != 'Sulfuras, Hand of Ragnaros' && item.quality -= 1
end

def validate_increment_quality(item)
  quality_on_range?(item) && increment_quality(item)
end

def quality_on_range?(item)
  (1..49).to_a.include?(item.quality)
end

def change_value_quality(item)
  item.name != "Aged Brie" && zero_or_reduce_quality(item) || quality_smaller_than_fifty(item)
end

def zero_or_reduce_quality(item)
  assign_zero_to_quality(item) || quality_greater_than_eigth(item)
end

def assign_zero_to_quality(item)
  item.name == 'Backstage passes to a TAFKAL80ETC concert' && (item.quality = 0) 
end

def quality_greater_than_eigth(item)
  item.quality > 8 && reduce_quality(item)
end

def quality_smaller_than_fifty(item)
  item.quality <50 && item.quality += 1
end

def increment_quality(item)
  item.quality += 1
  item.name == 'Backstage passes to a TAFKAL80ETC concert' && evaluate_sell_and_quality(item)
end

def evaluate_sell_and_quality(item)
  item.sell_in < 11 && quality_smaller_than_fifty(item)
  item.sell_in < 6 && quality_smaller_than_fifty(item)
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]

