require "artii"

class Quiz

  def initialize(filename)
    file = File.new(filename) #Creamos un objeto tipo File
    @lines = file.readlines #array con todas las lineas que estan en el archivo
    @size_file = @lines.size #tamaño del archivo
    run
  end

  def gets_name
    p "NAME:" # Imprimimos name
    @name = gets.chomp.capitalize #Solicitamos @name
  end

  def evaluator
    acu_q = 0 
    acu_r = 1
    acu_wrongs = 0
    @acu_correct = 0     
    
    while acu_q <= @size_file  
      puts @lines[acu_q]  
      answ = gets.chomp.downcase #respuesta del usuario 
      if answ == @lines[acu_r].chomp.downcase #evaluar si la respuesta del usuario coincide con la respuesta del archivo
        acu_q += 3 #cada 3 lineas se ingresa una nueva pregunta
        acu_r += 3 #cada 3 lineas se ingresa una respuesta
        puts "Good job #{@name}!!!!!!!!!!!!!!!!, next question..."
        @acu_correct += 1
      else           
        acu_wrongs += 1
        puts "Error #{acu_wrongs}, te quedan #{3 - acu_wrongs} intentos #{@name}"
        if acu_wrongs == 3
          acu_q += 3
          acu_wrongs = 0
        end     
      end
    end
  end

  def cheer
    a = Artii::Base.new :font => 'slant'
    puts a.asciify('CASI QUE NO!!!!')
    p "#{@name.upcase} HAZ FINALIZADO EL RETO DE RUBY CON #{(@acu_correct/((@size_file + 1)/3.0))*100}% ACIERTOS"
  end

  def run 
    gets_name
    evaluator
    cheer
  end
end

test = Quiz.new("flashcard_samples.txt")
