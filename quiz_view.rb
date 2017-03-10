require 'artii'

class QuizView
  
  def initialize
    @funny_font = Artii::Base.new :font => 'slant'
  end

  def gets_name
    puts @funny_font.asciify('Bienvenid@ al quiz')
    puts "Tu Nombre:"
    @name = gets.chomp.capitalize
  end

  def receive_answer
    gets.chomp
  end

  def print_question(question)
    puts question
  end

  def print_attempts(num)
    puts "-------- #{@name} Tienes #{num} intentos!! --------"
  end

  def good
    puts "Bien #{@name}!! Respuesta correcta!"
  end

  def cheer(score)
    puts @funny_font.asciify('CASI QUE NO!!!!')
    puts "#{@name} HAZ FINALIZADO EL RETO DE RUBY CON #{score}% ACIERTOS"
  end
end
