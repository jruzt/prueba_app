class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :cart, dependent: :destroy
  has_one :rent, dependent: :destroy
  #validates :full_name, presence: true
  after_create :set_cart

  def set_total_cart
    cart_total = 0
    self.cart.cart_lines.each do |line|
      cart_total += line.movie_price
    end
    self.cart.update_attribute(:total, cart_total)
  end

  # def update_cart_total(price)
  #   total = current_user.cart.total
  #   total -= price
  #   self.cart.update_attribute(:total, total)
  # end



  def self.show_all
    User.all.each do |user|
      puts user.to_s
    end
  end

  def to_s
    "Name: #{full_name}, Email: #{email}"
  end

  private

    #Set User cart
    def set_cart
      cart = Cart.create(user_id: self.id)
      user = self
      user.update_attributes(cart_id: cart.id)
    end
end
