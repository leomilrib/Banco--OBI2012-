# ----------------------------------------------------------------------------
# cada caixa é um objeto que guarda (tempo_cliente, tempo_atend);
# a definição se o cliente pega fila ou não é dado pelo seu horário de chegada:
#   - se seu horário de chegada for menor do que o menor tempo_atend, sua espera é igual ao tempo_cliente do menor tempo_atend menos seu horário de chegada.
#   - caso contrário, não há espera.
# ----------------------------------------------------------------------------
require './agencia'

def main
  clientes_insatisfeitos = 0

  entrada = File.readlines("./entrada")
  # entrada = File.readlines("./entrada1")
  # entrada = File.readlines("./entrada2")

  c,n = linha_para_array(entrada.shift)

  agencia = Agencia.new(c)

  n.times do
    cliente = Cliente.new(linha_para_array(entrada.shift))

    espera = agencia.proximo_caixa.atender_cliente(cliente.informacoes)

    if cliente.cliente_insatisfeito?(espera)
      clientes_insatisfeitos += 1
    end

  end

  puts clientes_insatisfeitos
end

main