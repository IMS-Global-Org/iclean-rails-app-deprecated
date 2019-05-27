class AccessPolicy
  include AccessGranted::Policy

  def configure
    # Example policy for AccessGranted.
    # For more details check the README at
    #
    # https://github.com/chaps-io/access-granted/blob/master/README.md
    #
    # Roles inherit from less important roles, so:
    # - :admin has permissions defined in :member, :guest and himself
    # - :member has permissions from :guest and himself
    # - :guest has only its own permissions since it's the first role.
    #
    # The most important role should be at the top.
    # In this case an administrator.
    #
    # role :admin, proc { |user| user.admin? } do
    #   can :destroy, User
    # end

    # More privileged role, applies to registered users.
    #
    # role :member, proc { |user| user.registered? } do
    #   can :create, Post
    #   can :create, Comment
    #   can [:update, :destroy], Post do |post, user|
    #     post.author == user
    #   end
    # end

    # The base role with no additional conditions.
    # Applies to every user.
    #
    # role :guest do
    #  can :read, Post
    #  can :read, Comment
    # end
    #

    # NOTE:
    # Roles inherit from less important roles below them,
    #    but only from roles which apply to the given user.
    #    So we only need to add additional permissions on top of them.
    role :super, is_super?: true do
    end

    role :admin, is_admin?: true do
      can :manage, Address
    end

    role :employer, is_employer?: true do
    end

    role :employee, is_employee?: true do
    end

    role :member, is_member?: true do
      can :manage, Address
    end

    role :guest, is_guest?: true do
    end

    role :visitor do
    end

  end
end
