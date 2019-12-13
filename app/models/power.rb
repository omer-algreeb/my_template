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
    User
  end

  power :creatable_users do
    User
  end

  power :updatable_users do
    User
  end

  power :destroyable_users do
    User
  end

  power :bills_index,
        :bills_show,
        :creatable_bill,
        :updatable_bills,
        :destroyable_bills do
    current_user.bills
  end

  power :acconts_index,
        :acconts_show,
        :creatable_acconts,
        :updatable_acconts,
        :destroyable_acconts do
    User
  end

  power :dashboard do
    true # not a scope, but a boolean power. This is useful to control access to stuff that doesn't live in the database.
  end
end