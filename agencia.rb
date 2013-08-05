# ----------------------------------------------------------
# Classes e metodos necessarios para resolver o problema 'Banco'
# ----------------------------------------------------------
# Classes:
#   Agencia -> #proximo_caixa
#   Caixa -> #atender_cliente
#   Cliente -> #cliente_insatisfeito?
#
# Metodos:
#   linha_para_array -> recebe string de entrada e retorna array com duas posições
# ----------------------------------------------------------

# Tempo maximo definido por lei que um cliente pode esperar para ser atendido
TEMPO_MAXIMO_ESPERA = 20

# ------------
# CLASSES
# ------------
class Agencia
# caixas => array com caixas abertos para atender
  attr_accessor :caixas

  def initialize c
    @caixas = Array.new(c) { |cx| cx = Caixa.new}
  end

  def proximo_caixa
    caixa = @caixas.min_by { |cx| cx.tempo_ocupado }
    # caso contrario: warning: assigned but unused variable - caixa
    caixa
  end

end

class Caixa
# @tempo_ocupado => tempo decorrido até terminar o atendimento
  attr_accessor :tempo_ocupado

  def initialize
    @tempo_ocupado = 0
  end

  def atender_cliente cliente_info
    espera = 0
    chegada,tempo = cliente_info
    if chegada < @tempo_ocupado
      espera = @tempo_ocupado - chegada
      @tempo_ocupado += tempo
    else
      @tempo_ocupado = chegada + tempo
    end
    espera
  end

end

class Cliente
# informacoes => array contendo: horario de chegada do cliente na Agencia [0] e o tempo necessário para o atendimento [1]
  attr_accessor :informacoes
  def initialize info
    @informacoes = info
  end

  def cliente_insatisfeito? espera
    espera > TEMPO_MAXIMO_ESPERA
  end
end

# ----------
# METODOS
# ----------
def linha_para_array entrada
  entrada.split.map(&:to_i)
end