class RentsController < ApplicationController

  def create
    user = current_user
    if params[:movie_id] == 'all'
      Rent.create(user_id: user.id, active: true, movies: user.cart.cart_lines.count)
      user.update_attribute(:active_rent, true)
    end
  end

  def index

  end

  def destroy
    rent_id = params[:rent_id]
    Rent.where(id: rent_id).first.destroy
    current_user.cart.cart_lines.destroy_all
    current_user.update_attribute(:active_rent, false)
    current_user.cart.update_attribute(:total, nil)
    @success = true
    # if @success
    #   response = {status: 'success', notice: "Rent was destroyed", redirect_to: root_path}
    # end
    # respond_to do |format|
    #   format.json { render json: response }
    # end
    #redirect_to request.referer || rent_path
  end
end
