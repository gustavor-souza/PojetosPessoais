#model criada pelo cancancan e modificada para os roles de atendentes e users
class Ability
  include CanCan::Ability

  def initialize(user)
     user ||= User.new
     if user.attendant?
       can :attend, :all
     else
       can :read, :all, creator: user.id
     end
  end
end
