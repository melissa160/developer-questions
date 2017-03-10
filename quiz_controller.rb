require_relative 'quiz'
require_relative 'quiz_view'

class QuizController
  def initialize(filename)
    @quiz = Quiz.new(filename)
    @view = QuizView.new
    start_game
  end

  def start_game
    @view.gets_name
    @QA_set = @quiz.create_question_set
    run
  end

  def run
    @position = 0
    @count_activate = 0
    @score = 0
    @attempts = 0

    while @position < @QA_set.size

      question = @QA_set[@position].q_text
      right_answer = @QA_set[@position].a_text

      @view.print_attempts(3-@attempts)
      @view.print_question(question)
      user_answer = @view.receive_answer
      
      validate_answer(right_answer, user_answer)

    end
    final_score
  end

  def validate_answer(right_answer, user_answer)
    if @quiz.is_correct?(right_answer, user_answer)
      @view.good
      @position += 1; @score += 1; @attempts = 0
    else
      @attempts += 1
      result = @quiz.attempts(@attempts, @position)
      @position =result[0]; @attempts = result[1]
    end
  end

  def final_score
    score = @quiz.score(@score, @position)
    @view.cheer(score)
  end

end

test = QuizController.new("flashcard_samples.txt")