class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_lines, dependent: :destroy

  # def set_total_cart
  #   current_user.cart.cart_lines.each do |line|
  #     @cart_total += line.movie_price
  #   end
  #   current_user.cart.update_attribute(:total, @cart_total)
  # end

end
