class AddMoviePriceToCartLine < ActiveRecord::Migration[5.0]
  def change
    add_column :cart_lines, :movie_price, :float
  end
end
