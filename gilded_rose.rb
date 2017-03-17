def quality_smaller_than_fifty(item)
  range_quality = (1..49).to_a
  range_quality.include?(item.quality) && item.quality += 1
end

def validate_increment_quality(item)
  item.quality += 1
  item.name == 'Backstage passes to a TAFKAL80ETC concert' && evaluate_sell_and_quality(item)
end

def evaluate_sell_and_quality(item)
  (-10..10).to_a.include?(item.sell_in) && quality_smaller_than_fifty(item)
  (-10..5).to_a.include?(item.sell_in) && quality_smaller_than_fifty(item)
end

def block3(item)
  item.name != "Aged Brie" && block4(item) || quality_smaller_than_fifty(item)
end

def block4(item)
  block6(item) || subtrack_quality_if_possible(item)
end

def subtrack_quality_if_possible(item)
  ((9..80).to_a.include?(item.quality) && item.name != 'Sulfuras, Hand of Ragnaros' && (item.quality -= 1))
end

def block6(item)
  item.name == 'Backstage passes to a TAFKAL80ETC concert' && (item.quality = 0) 
end

def block7(item)
  item.name == 'NORMAL ITEM' || item.name == 'Sulfuras, Hand of Ragnaros'
end

def block8(item)
  (1..80).to_a.include?(item.quality) && item.name != 'Sulfuras, Hand of Ragnaros' && item.quality -= 1
end

def block9(item)
  (1..49).to_a.include?(item.quality) && validate_increment_quality(item)
end

def start(item)
  block7(item) && block8(item) || block9(item)
  item.name != 'Sulfuras, Hand of Ragnaros' &&  item.sell_in -= 1
  (-11..-1).to_a.include?(item.sell_in) && block3(item)
end

def update_quality(items)
  items.each do |item|
    start(item)
  end
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

