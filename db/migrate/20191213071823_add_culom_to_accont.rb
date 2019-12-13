class AddCulomToAccont < ActiveRecord::Migration[6.0]
  def change
    add_column :acconts, :account_balance, :float, null: :true
    #Ex:- :null => false
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
