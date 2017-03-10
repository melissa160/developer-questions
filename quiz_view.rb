class QuizView
   def gets_name
    p "NAME:" # Imprimimos name
    @name = gets.chomp.capitalize #Solicitamos @name
  end

  def receive_answer
    gets.chomp
  end

  def print_question(question)
    puts question
  end

  def print_attempts(num)
    puts "-------- #{@name} Te queda #{num} intentos!! --------"
  end

  def cheer
    a = Artii::Base.new :font => 'slant'
    puts a.asciify('CASI QUE NO!!!!')
    p "#{@name.upcase} HAZ FINALIZADO EL RETO DE RUBY CON #{(@acu_correct/((@size_file + 1)/3.0))*100}% ACIERTOS"
  end
end
