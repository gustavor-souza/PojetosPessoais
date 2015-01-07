class Zombie < ActiveRecord::Base
  scope :rotting, where(rotting: true)
  scope :fresh, where("age < 20")
  scope :recent, order("created_at desc").limit(5)

  def make_rotting
    self.rotting = true if age > 20
  end

end
