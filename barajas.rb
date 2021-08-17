require_relative 'carta'

class Baraja
  attr_accessor :cartas

  def initialize(cartas)
    @cartas = cartas
  end

  def barajar
    @cartas = @cartas.shuffle
  end

  def sacar
    @cartas.pop
  end

  def repartir
    @cartas.pop(5)
  end
end

cartas = []
pintas = ['C', 'D', 'E', 'T']
pintas.each do |i|
  13.times do |y|
    x = Carta.new(y+1, i)
    cartas.push(x)
  end
end

baraja1 = Baraja.new(cartas)

print baraja1.barajar
puts ""
print baraja1.sacar
puts ""
print baraja1.repartir
