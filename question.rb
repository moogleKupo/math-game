class Question
  attr_reader :question, :answer

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @question = "What is #{@num1} + #{@num2}?"
    @answer = @num1 + @num2
  end

  def ask_question
    @question
  end

  def validate_answer(player_answer)
    player_answer.to_i == @answer
  end
end
