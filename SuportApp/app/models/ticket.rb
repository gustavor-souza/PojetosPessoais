class Ticket < ActiveRecord::Base
  has_one :client, dependent: :destroy
  has_one :admin, dependent: :destroy

end
