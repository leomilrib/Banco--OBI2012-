=begin
  cada caixa é um objeto que guarda (tempo_cliente, tempo_atend);
  a definição se o cliente pega fila ou não é dado pelo seu horário de chegada:
    - se seu horário de chegada for menor do que o menor tempo_atend, sua espera é igual ao tempo_cliente do menor tempo_atend menos seu horário de chegada.
    - caso contrário, não há espera.
=end

require './caixa.rb'

def main
  entrada = File.readlines("./entrada")
  fila(entrada)

  # entrada = File.readlines("./entrada1")
  # fila(entrada)

  # entrada = File.readlines("./entrada2")
  # fila(entrada)
end

def fila entrada
  caixas_abertos = []
  atendimentos_atrasados = 0

  c = entrada[0].split(' ').first.to_i
  n = entrada[0].split(' ').last.delete('\n').to_i


  # inicializa os caixas e coloca os primeiros clientes
  for i in (0...c)
    caixas_abertos.push Caixa.new(entrada[i+1])
  end

  # começa do segundo cliente e vai ate o ultimo
  for i in (c+1..n)
    espera = proximo_caixa(caixas_abertos).atender_cliente(entrada[i])

    if espera > 20
      atendimentos_atrasados +=1
    end
  end

  puts atendimentos_atrasados
end

def proximo_caixa caixas
  caixa = caixas[0]
  caixas.each do |cx|
    if cx.tempo_atend < caixa.tempo_atend
      caixa = cx
    end
  end
  caixa
end

main