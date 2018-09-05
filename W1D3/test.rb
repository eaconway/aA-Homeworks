class Array
  def subsets
    return [[]] if empty?
    subs = take(count - 1).subsets
    p subs
    subs.concat(subs.map { |sub| sub + [last] })
  end
end
