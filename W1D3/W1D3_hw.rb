def sum_to (n)
  if n == 1
    1
  elsif n < 0
    nil
  else
    n + sum_to(n-1)
  end
end

def add_numbers (nums_array)
  if nums_array.length == 1
    nums_array[0]
  elsif nums_array == []
    nil
  else
    num = nums_array.pop
    num + add_numbers(nums_array)
  end
end

def gamma_fnc (n)
  if n == 0
    nil
  elsif n == 1
    1
  else
    (n-1) * gamma_fnc(n-1)
  end
end

def ice_cream_shop(flavors,favorite)
  if flavors.length == 1
    flavors[0] == favorite
  elsif flavors.length == 0
    return false
  else
    flavor = flavors.pop
    if flavor == favorite
      return true
    else
      ice_cream_shop(flavors, favorite)
    end
  end
end

def reverse (str)
  if str.length == 0
    str
  else
    reverse(str[1..-1]) + str[0]
  end
end
