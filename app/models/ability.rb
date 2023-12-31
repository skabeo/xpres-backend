class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Product, public: true
    can :read, Review, public: true

    if user.persisted?
      can :create, Order
      can :read, Order, user_id: user.id
      can :read, Payment, user_id: user.id

      can %i[update destroy], Review, user_id: user.id
    end

    can :manage, :all if user.role == 'admin'
  end
end
