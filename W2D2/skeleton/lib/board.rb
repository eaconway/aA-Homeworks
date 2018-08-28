require "byebug"

class Board
  attr_accessor :cups, :p1_store, :p2_store, :p1, :p2

  def initialize(name1, name2)
    @cups = Array.new(14)
    @p1, @p2 = name1, name2
    @p1_store = 6
    @p2_store = 13
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_index do |idx|
      unless idx == 6 || idx == 13
        @cups[idx] = Array.new(4){:stone}
      else
        @cups[idx] = Array.new
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless (0..13).include?(start_pos)
    raise "Starting cup is empty" if @cups[start_pos].empty?
    true
  end

  def make_move(start_pos, current_player_name)
    @current_player = current_player_name
    other_store = (current_player_name == p1 ? @p2_store : @p1_store)

    start_pos -= 1 if (1..6).include?(start_pos)

    stones = @cups[start_pos].dup
    @cups[start_pos] = []

    until stones.empty?
      start_pos = (start_pos + 1) % (@cups.length)
      unless start_pos == other_store
        @cups[start_pos] << stones.shift
      end
    end
    start_pos += 1

    render
    next_turn(start_pos, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if @cups[ending_cup_idx].empty?
      :switch
    elsif ending_cup_idx == (current_player_name == p1 ? @p1_store : @p2_store)
      :prompt
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all?{|cup| cup.empty?}
    return true if @cups[7..12].all?{|cup| cup.empty?}
    false
  end

  def winner
    puts "Congrats, #{@current_player} won!"
  end
end
