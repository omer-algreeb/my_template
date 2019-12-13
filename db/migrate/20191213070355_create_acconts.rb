class CreateAcconts < ActiveRecord::Migration[6.0]
  def change
    create_table :acconts do |t|
      t.string :email
      t.string :account_number
      t.belongs_to :user, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
