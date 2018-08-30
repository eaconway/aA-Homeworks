tester = ['fish', 'fiiish', 'fiiiiish', 'fiiiish',
  'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
tiles_array = ["up", "right-up", "right", "right-down",
     "down", "left-down", "left",  "left-up" ]
tiles_hash = { "up" => 0,"right-up" => 1, "right"=> 2,"right-down" => 3,
      "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7}

def sluggish_octopus(var)
  longest_slug = ''

  var.each do |word|
    longest_slug = word if var.all?{|word2| word.length >= word2.length}
  end

  longest_slug
end

def dominant_octopus(var)
  p merge_sort(var).last
end

def merge_sort(var)
  return var if var.length <=1
  mid = var.length/2
  left = var.take(mid)
  right = var.drop(mid)

  sorted_left = merge_sort(left)
  sorted_right = merge_sort(right)

  merge(sorted_left,sorted_right)
end

def merge(left, right)
  merged = []

  until left.empty? || right.empty?
    if left.first.length < right.first.length
      merged << left.shift
    else
      merged << right.shift
    end
  end

  merged + left + right
end


def clever_octopus(var)
  longest_slug = ""

  var.each{|el| longest_slug = el if el.length > longest_slug.length}

  p longest_slug
end

def slow_dance(direction, tile_array)
  tile_array.each_with_index do |tile, idx|
    p idx if direction == tile
  end
end

def fast_dance(dir, tiles_hash)
  p tiles_hash[dir]
end
############ TESTS #########


# sluggish_octopus(tester)
dominant_octopus(tester)
# clever_octopus(tester)
slow_dance("left-up", tiles_array)
fast_dance("left-up", tiles_hash)
