class Game
  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player_index = 0
    @game_over = false
  end

  def start_game
    until @game_over
      current_player = @players[@current_player_index]
      question = Question.new
      puts "#{current_player.name}, #{question.ask_question}"

      player_answer = gets.chomp

      if question.validate_answer(player_answer)
        puts "Correct!"
      else
        puts "Incorrect! #{current_player.name} loses a life."
        current_player.reduce_lives
      end

      display_scores
      switch_player
      check_game_over
    end
  end

  def display_scores
    puts "Scores:"
    @players.each { |player| puts "#{player.name}: #{player.lives} lives" }
    puts "-----------"
  end

  def switch_player
    @current_player_index = (@current_player_index + 1) % @players.length
  end

  def check_game_over
    @game_over = @players.any? { |player| player.lives <= 0 }

    if @game_over
      winner = @players.find { |player| player.lives > 0 }
      puts "#{winner.name} wins! Game over."
    end
  end
end
