class Usuario
  def initialize(nombre, cuentas)
    @nombre = nombre
    @cuentas = cuentas
  end

  def saldo_total
    saldo_total = 0
    @cuentas.each do |cuentas|
      saldo_total += cuentas.saldo
    end
    saldo_total
  end
end

class CuentaBancaria
  attr_accessor :saldo

  def initialize(banco, numero_cuenta, saldo = 0)
    @banco = banco
    @numero_cuenta = numero_cuenta
    @saldo = saldo
  end

  def transferir(monto, otra_cuenta)
    raise ArgumentError, 'No hay suficiente saldo para realizar la transferencia.' if monto > @saldo

    @saldo -= monto
    otra_cuenta.saldo += monto
  end
end

c1 = CuentaBancaria.new('Bco Chile', 123456, 5000)
c2 = CuentaBancaria.new('Bco Santander', 134765, 5000)

puts c1.saldo
puts c2.saldo

c1.transferir(3000, c2)

puts c1.saldo
puts c2.saldo

u1 = Usuario.new('Usuaruo1', [c1, c2])
puts u1.saldo_total
