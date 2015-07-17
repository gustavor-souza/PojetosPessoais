module TicketsHelper
  def dead_line(created_at)
    # se faz mais de 48 horas
    atrasado = (created_at + 2.days) <  Time.zone.now ? " atrasado" : ""
    # concatena com o valor da variavel
    distance_of_time_in_words(created_at + 2.days, Time.zone.now, true,
    accumulate_on: :hours, only: [:hours, :minutes], locale: :br) + atrasado
  end
end
