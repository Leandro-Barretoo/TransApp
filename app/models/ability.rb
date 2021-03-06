class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Buy, author: user
    can :manage, Group, user: user
  end
end
