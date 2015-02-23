class Ticket < ActiveRecord::Base
  belongs_to :system
  belongs_to :subject
  belongs_to :client, class_name: "User", foreign_key: "client_id"
  belongs_to :analyst, class_name: "User", foreign_key: "analyst_id"
  belongs_to :status
  belongs_to :priority
  has_many :comments

  scope :by_user, -> (client_id){where(client_id: client_id )}

  validates :title, presence: true, length: {minimum: 1, maximum: 60}

  accepts_nested_attributes_for :comments

  def time_to_respond

    time = (Time.now - created_at) - 8.hour
    cute_date=Array.new
    tables=[["hora", 60*60], ["minuto", 60] ]
    later = ""

    tables.each do |unit, value|
      o = time.divmod(value)
      # verifica se vai haver pluralizacao (entre -1 e 1 hora de diferenca)
      unit = !o[0].between?(-1,1) ? unit.pluralize : unit
      later = "atrasado " if  o[0] < 0
      cute_date.push("#{o[0]} #{unit}") unless o[0] == 0
      time = o[1]
    end

    return "#{cute_date.join(' e ')} #{later}para uma resposta".gsub("-","")
  end
end
