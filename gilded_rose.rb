def quality_semaller_than_fifty(item)
  range_quality = (1..49).to_a
  range_quality.include?(item.quality) && item.quality += 1
end

def update_quality(items)
 
  items.each do |item|
    if item.name == 'NORMAL ITEM' || item.name == 'Sulfuras, Hand of Ragnaros'
      (1..80).to_a.include?(item.quality) && item.name != 'Sulfuras, Hand of Ragnaros' && item.quality -= 1
    else
      if (1..49).to_a.include?(item.quality)
        item.quality += 1
        if item.name == 'Backstage passes to a TAFKAL80ETC concert'
          (-10..10).to_a.include?(item.sell_in) && quality_semaller_than_fifty(item)
          (-10..5).to_a.include?(item.sell_in) && quality_semaller_than_fifty(item)
        end
      end
    end
 
    item.name != 'Sulfuras, Hand of Ragnaros' &&  item.sell_in -= 1

    if item.sell_in < 0
      if item.name != "Aged Brie"
        if item.name == 'Backstage passes to a TAFKAL80ETC concert'
          item.quality = 0
        else
          (9..80).to_a.include?(item.quality) && item.name != 'Sulfuras, Hand of Ragnaros' && item.quality -= 1
        end
      else
        quality_semaller_than_fifty(item)
      end
    end
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

