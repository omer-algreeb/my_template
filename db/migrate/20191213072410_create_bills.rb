class CreateBills < ActiveRecord::Migration[6.0]
  def change
    create_table :bills do |t|
      t.string :title
      t.float :price
      t.date :date
      t.text :description
      t.belongs_to :user

      t.timestamps
    end
  end
end
