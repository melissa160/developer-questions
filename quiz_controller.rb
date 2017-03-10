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
    while @position < @QA_set.size

      question = @QA_set[@position].q_text
      right_answer = @QA_set[@position].a_text

      @view.print_question(question)
      user_answer = @view.receive_answer
      validate_answer(right_answer, user_answer)
    end 
  end

  def validate_answer(right_answer, user_answer)
      if @quiz.is_correct?(right_answer, user_answer) || @try
        @position += 1
        @count_activate = 0
        @try = false
      else
        attempts
      end
  end

  def attempts
    @count_activate += 1
    @try = true if @count_activate == 2
    @view.print_attempts(3-@count_activate)
  end

end

test = QuizController.new("flashcard_samples.txt")