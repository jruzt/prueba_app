class CartLine < ApplicationRecord
  belongs_to :cart
  belongs_to :movie

  # def set_total_cart
  #   current_user.cart.cart_lines.each do |line|
  #     @cart_total += line.movie_price
  #   end
  #   current_user.cart.update_attribute(:total, @cart_total)
  # end

  def to_s
    "ID: #{id}, Cart_id: #{cart_id}, Movie_id: #{movie_id}"
  end

  def self.show_all
    CartLine.all.each do |line|
      puts line
    end
  end
end
