class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      
      t.string :name, null: false
      t.string :website, null: false
      t.string :admin_email
      t.string :contact_number
      t.string :address, null: false
      t.string :city, null: false
      t.string :country, null: false
      t.string :slug, null: false
      t.string :name_ar, null: false
      t.string :address_ar, null: false
      t.string :city_ar, null: false
      t.string :country_ar, null: false
      t.boolean :is_enabled, default: true, null: false

      t.timestamps
    end
  end
end
