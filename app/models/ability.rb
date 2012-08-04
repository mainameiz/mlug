class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :delete, :to => :destroy
    user ||= User.new
    if user.admin?
      can :manage, :all
    end
    if user.moderator?
      can :update, [ Post, Comment ]
    end
    if user.not_banned?
      can [ :create, :replay, :preview ], [ Post, Comment ] if user.not_guest?
      can [ :update, :destroy ], Post, :user_id => user.id
    end

    can :read, :all
  end
end
