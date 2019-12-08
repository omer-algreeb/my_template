class AddStatusUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :status, :integer, default: 0
    #Ex:- :default =>''
  end
end
