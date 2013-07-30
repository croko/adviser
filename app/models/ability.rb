class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)

    can :manage, :all
    #cannot :manage, :all
    #can :read, [Doctor, Category, Clinic, Comment]

    if user.persisted?
      can :create, [Advise, User, Comment]
      #can :update, [Doctor, Clinic], :user_id => user.id
    end

    if user.role?('admin')
      can :manage, :all
    end
  end
end
