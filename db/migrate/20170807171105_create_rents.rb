class CreateRents < ActiveRecord::Migration[5.0]
  def change
    create_table :rents do |t|
      t.references :user, foreign_key: true
      t.boolean :active, default: false
      t.integer :movies

      t.timestamps
    end
  end
end
