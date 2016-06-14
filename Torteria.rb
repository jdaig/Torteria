require "benchmark"

class Lote
attr_accessor :tiempo_coccion, :super_lote
  def initialize(orden) #orden es un arreglo de objetos
    @tiempo_coccion
    @orden = orden
    @lote_4 = []
    @lote_5 = []
    @lote_6 = []
    @super_lote = []
  end

  def separar_por_lotes
    @orden.each do |torta|
      if torta.tiempo_coccion == 4
        @lote_4 << torta
      elsif torta.tiempo_coccion == 5
        @lote_5 << torta
      else
        @lote_6 << torta
      end
    end
    @super_lote = [@lote_4,@lote_5,@lote_6]
  end 
  
end

class Horno
  def mensaje(lotes)
    lotes.each_with_index{|lote, i|
    puts "Mete al horno el lote #{i+4}"
    puts lote
    sleep i+4
    puts "Saca el lote #{i+4}"}
  end
end

class Torta
  attr_accessor :tiempo_coccion
  def initialize
    @tiempo_coccion
  end
end

class T_Jamon <Torta
  def initialize
    @tiempo_coccion = 4
  end
end

class T_Milanesa <Torta
  def initialize
    @tiempo_coccion = 6
  end
end 

class T_Pollo <Torta
  def initialize
    @tiempo_coccion = 5
  end
end

class T_Salchicha <Torta
  def initialize
    @tiempo_coccion = 5
  end
end

# p "Menu de Tortas"
# p ">Jamon"
# p ">Milanesa"
# p ">Pollo"
# p ">Salchicha"

# p "Dame tu orden en este formato"
# p "Jamon,Milanesa,Pollo,Salchicha"
# orden=gets.chomp

# cantidad=orden.split(',')

# T_J = T_Jamon.new(cantidad[0])
# T_M = T_Milanesa.new(cantidad[1])
# T_P = T_Pollo.new(cantidad[2])
# T_S = T_Salchicha.new(cantidad[3])



# lote = [T_J, T_M, T_P, T_S]
orden = []

3.times {orden << T_Jamon.new}
3.times {orden << T_Pollo.new}
3.times {orden << T_Milanesa.new}
2.times {orden << T_Salchicha.new}






lotes = Lote.new(orden).separar_por_lotes
horno = Horno.new.mensaje(lotes)
