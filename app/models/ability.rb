class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Food, user:
  end
end
