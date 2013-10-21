class AdminAbility
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new # guest user (not logged in)

    cannot :manage, :all
    can :read, [Doctor, Category, Clinic, Comment]

    if user.role?('manager')
      can :read, :all
      can :read, :dashboard
    end
    if user.role?('admin')
      can :manage, :all
    end

  end
end