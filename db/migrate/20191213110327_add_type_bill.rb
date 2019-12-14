class AddTypeBill < ActiveRecord::Migration[6.0]
  def change
    add_column :bills, :type_bill, :integer, index: true, null: false
  end
end
