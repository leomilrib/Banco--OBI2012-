=begin
  @tempo_cliente => tempo necessário para atender o cliente
  @tempo_atend => tempo decorrido até terminar o atendimento
=end

class Caixa
  attr_accessor :tempo_atend, :tempo_cliente

  def initialize linha
    chegada = linha.split(' ').first.to_i
    tempo = linha.split(' ').last.delete('\n').to_i
    @tempo_atend = chegada +tempo
    @tempo_cliente = 0
  end

  def atender_cliente linha
    espera = 0
    chegada = linha.split(' ').first.to_i
    tempo = linha.split(' ').last.delete('\n').to_i
    
    if chegada < @tempo_atend
      # puts chegada < @tempo_atend
      espera = @tempo_atend -chegada
      @tempo_atend += tempo
      # puts "#{@tempo_atend}"
    else
      @tempo_atend = chegada +tempo
    end

    @tempo_cliente = tempo

    # puts espera
    espera
  end
end
