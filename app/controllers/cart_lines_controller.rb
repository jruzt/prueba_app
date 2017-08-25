class CartLinesController < ApplicationController

  def create
    @movie = Movie.where(id: params[:movie_id]).first
    cart = current_user.cart
    element = cart.cart_lines.build(movie_id: @movie.id, movie_name: @movie.name,
                          movie_description: @movie.description, movie_price: @movie.price)
    if cart.cart_lines.where(movie_id: @movie.id).count >= 1
      @error = ""
    else
      cart.total = 0 if cart.total.nil?
      cart.total += element.movie_price
      cart.save
    end
  end

  def destroy
    # byebug
    if (params[:movie_id] == 'all')
      current_user.cart.cart_lines.destroy_all
      current_user.cart.update_attributes(total: nil)
      return
    end
    @cart_line = CartLine.where(id: params[:movie_id]).first
    @cart_line.destroy
    current_user.set_total_cart
    @total = current_user.cart.total
    # current_user.cart.cart_line
    # cart_total = current_user.cart.total # Preguntar si es la manera correcta de hacerlo asignar
    # @total = cart_total - @cart_line.movie_price
    # current_user.cart.update_attributes(total: @total)

    # current_user.set_total_cart
    # respond_to do |format|
    #   format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
    #   format.js { redirect_to my_cart_path, notice: 'Movie was removed from cart'}
    # end
  end


  private
    def cart_line_params
      params.require(:cart_line).permit(:cart_id, :movie_id, :movie_name, :movie_description, :movie_price)
    end
  end
