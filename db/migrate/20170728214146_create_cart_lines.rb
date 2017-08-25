class CreateCartLines < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_lines do |t|
      t.references :cart, foreign_key: true
      t.references :movie, foreign_key: true
      t.string :movie_name
      t.string :movie_description

      t.timestamps
    end
  end
end
