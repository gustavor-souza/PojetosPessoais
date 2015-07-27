module TicketsHelper
  def dead_line(created_at)
    # se faz mais de 48 horas
    late =  previewed_date(created_at) <  Time.zone.now ? " atrasado" : ""
    # verifica o tempo estimado para a resposta com ralação a deadline
    if more_than_a_week?(created_at)
      time = 'mais de 7 dias'
    else
      time = distance_of_time_in_words(previewed_date(created_at), Time.zone.now, true,
      accumulate_on: :hours, only: [:hours, :minutes], locale: :br)
    end
    time + late
  end

  private

  def previewed_date(created_at)
    created_at + 2.days
  end
  #verifica se ultrapassou uma semana
  def more_than_a_week?(created_at)
    previewed_date(created_at) + 7.days < Time.zone.now
  end
end
