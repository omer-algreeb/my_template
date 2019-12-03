class Power
  include Consul::Power

  attr_accessor :current_user

  def initialize(user)
    self.current_user = user
  end

  power :users_index do
    User.all
  end

  power :users_show do
    User.find(current_user.id)
  end

  power :creatable_users do
    current_user
  end

  power :updatable_users do
    current_user
  end

  power :destroyable_users do
    User.all
  end

  power :dashboard do
    true # not a scope, but a boolean power. This is useful to control access to stuff that doesn't live in the database.
  end

end