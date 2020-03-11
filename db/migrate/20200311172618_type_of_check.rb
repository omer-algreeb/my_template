class TypeOfCheck < ActiveRecord::Migration[6.0]
  def change
    create_table :type_of_checks do |t|
      t.references :category
      t.references :organizations

      t.timestamps
    end
  end
end
