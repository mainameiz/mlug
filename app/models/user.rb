class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
 
  attr_accessible :nickname,
    :jabber,
    :city,
    :distributions,
    :interests

  has_many :posts
  has_many :comments

  ROLES = %w[ banned moderator admin ]

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def admin?
    has_role? :admin
  end

  def moderator?
    has_role? :moderator
  end

  def guest?
    id.nil?
  end

  def not_guest?
    not guest?
  end

  def banned?
    has_role? :banned
  end

  def not_banned?
    not banned?
  end

  def has_role?(role)
    roles.include?(role.to_s)
  end

  def is?(role)
    has_role?(role)
  end
end
