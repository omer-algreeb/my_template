class AddOrganizationToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :organization, index: true, foreign_key: true
  end
end
