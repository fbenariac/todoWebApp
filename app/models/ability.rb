# CanCan Ability model
class Ability

  # Cancancan
  include CanCan::Ability

  # Set Users' roles
  def initialize(user)

    user ||= User.new

    # Admins can do everythings.
    if user.admin?
      can :manage, :all
    end

    # Users can read create and update his post
    if user.user?

      can %i[create read update], Task

      # we must be record's owner to edit it.
      if user.id
        can %i[create read update destroy], Task, { user_id: user.id }
      end

    end

    # guest can read.
    if user.guest?
      can :read, Task
    end

  end

end
