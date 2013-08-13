class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)

    cannot :manage, :all
    can :read, [Doctor, Category, Clinic, Comment]

    if user.persisted?
      can :create, [Advise, Comment]
      can :update, [Doctor,Clinic], :user_id => user.id
      can :update, [User], :id => user.id
      can :read, [User], :id => user.id
    end
  end
end
