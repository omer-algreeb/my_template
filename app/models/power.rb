class Power
  include Consul::Power

  attr_accessor :current_user, :organization

  def initialize(user, organization)
    self.current_user = user
    self.organization = organization
  end

  power :users_index,
        :users_show,
        :creatable_users,
        :updatable_users,
        :destroyable_users do
    organization.users
  end

  power :organizations_index,
        :organizations_show,
        :creatable_organizations,
        :updatable_organizations,
        :destroyable_organizations do
    Organization
  end

  power :dashboard do
    true # not a scope, but a boolean power. This is useful to control access to stuff that doesn't live in the database.
  end

end