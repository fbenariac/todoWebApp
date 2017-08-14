# CanCan Ability model
class Ability

  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    # Admins can do everythings.
    if user.admin?
      can :manage, :all
    end

    # Users can read create and update his post
    if user.user?

      can [:create, :read, :update], Task

      # Il faut être le propriétaire d'un enregistrement pour l'éditer
      if user.id
        can [:create, :read, :update, :destroy], Task, { user_id: user.id }
      end

    end

    # guest can read.
    if user.guest?
      can :read, Task
    end

  end


end
