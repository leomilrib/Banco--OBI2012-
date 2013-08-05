# ----------------------------------------------------------------------------
# main
# ----------------------------------------------------------------------------
require './agencia'

def main
  clientes_insatisfeitos = 0

  #saida esperada para entrada é 23
  arquivo_entrada = File.readlines("./entrada") 
  #saida esperada para entrada1 é 1
  # arquivo_entrada = File.readlines("./entrada1")
  #saida esperada para entrada2 é 2
  # arquivo_entrada = File.readlines("./entrada2")

  c,n = linha_para_array(arquivo_entrada.shift)

  agencia = Agencia.new(c)

  n.times do
    cliente = Cliente.new(linha_para_array(arquivo_entrada.shift))

    espera = agencia.proximo_caixa.atender_cliente(cliente.informacoes)

    if cliente.cliente_insatisfeito?(espera)
      clientes_insatisfeitos += 1
    end

  end

  puts clientes_insatisfeitos
end

main