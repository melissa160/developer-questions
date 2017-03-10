require "artii"

#Contiene una pregunta con su respuesta
class QuestionSet
  attr_accessor :q_text, :a_text

  def initialize(q_tex, a_tex)
    @q_text = q_tex
    @a_text = a_tex
  end 
end

#Contiene el modelo para realizar el Quiz
class Quiz

  def initialize(filename)
    read_file(filename)
  end

  def read_file(filename)
    @lines = IO.readlines(filename)
  end

  def create_question_set
    questions = create_arr(0)
    answers = create_arr(1)
    @question_set = []
    questions.size.times do |i|
      @question_set << QuestionSet.new(questions[i], answers[i].chomp)
    end
    @question_set
  end

  def create_arr(rule)
    new_arr = []
    @lines.each_index do |ind|
      if ind % 3 == 0
        new_arr << @lines[ind+rule]
      end
    end
    new_arr
  end

  def is_correct?(right_answer, user_answer)
    right_answer.downcase == user_answer.downcase    
  end

  def attempts(attempts, position)
    if attempts == 3
      position += 1
      attempts = 0
    end
    return position, attempts
  end

  def score(score, total_questions)
    (((score*1.0)/(total_questions))*100).ceil
  end

end

  
