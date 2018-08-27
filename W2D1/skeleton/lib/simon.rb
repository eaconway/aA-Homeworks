class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(seq_length = 1)
    @sequence_length = seq_length
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    until @game_over
      round_success_message
      @sequence_length += 1
      @game_over = true
    end
  end

  def show_sequence
    add_random_color
    puts @seq
    sleep(1)
    system("clear")
  end

  def require_sequence
    begin
      puts "Please enter the sequence you just saw, in order"
      user_seq = gets.chomp
    rescue ArgumentError
      puts "that was the incorrect sequence..."
    ensure
      @game_over = true
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message

  end

  def game_over_message
    puts "Contrats, the game is over. You won!"
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false
  end
end

if __FILE__ = $PROGRAM_NAME

end
