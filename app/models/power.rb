class Power
  include Consul::Power

  attr_accessor :current_user

  def initialize(user)
    self.current_user = user
  end

  def get_by_role
    if current_user.is_admin?
      User.all
    else
      User.onle_permission(current_user.id)
    end
  end

  power :users_index do
    get_by_role
  end

  power :users_show,
        :creatable_users,
        :updatable_users,
        :destroyable_users do
    if current_user.is_admin?
      User
    else
      User.where(id: current_user.id)
    end
  end

  power :bills_index,
        :bills_show,
        :creatable_bills,
        :updatable_bills,
        :destroyable_bills do
    if current_user.is_admin?
      Bill.all
    else
      current_user.bills
    end
  end

  power :acconts_index,
        :acconts_show,
        :creatable_acconts,
        :updatable_acconts,
        :destroyable_acconts do
    if current_user.is_admin?
      Accont.all
    else
      Accont.where(id: current_user.accont.id)
    end
  end

  power :dashboard do
    true # not a scope, but a boolean power. This is useful to control access to stuff that doesn't live in the database.
  end
end
