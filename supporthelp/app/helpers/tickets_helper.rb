module TicketsHelper
  def dead_line(created_at)
    # se faz mais de 48 horas
    @timezone_now = Time.zone.now
    late =  previewed_date(created_at) <  @timezone_now ? " atrasado" : ""
    # verifica o tempo estimado para a resposta com ralação a deadline
    calculate_deadline(created_at, late)
  end

  private

  def calculate_deadline(created_at, late)
    if more_than_a_week?(created_at)
      time = 'mais de 7 dias'
    else
      time = distance_of_time_in_words(previewed_date(created_at), @timezone_now, true,
      accumulate_on: :hours, only: [:hours, :minutes], locale: :br)
    end
    time + late
  end

  def previewed_date(created_at)
    created_at + 2.days
  end
  #verifica se ultrapassou uma semana
  def more_than_a_week?(created_at)
    previewed_date(created_at) + 7.days < @timezone_now
  end
end
