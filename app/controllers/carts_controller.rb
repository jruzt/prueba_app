class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to root_path, alert: 'You have one pending rent' if current_user.active_rent?
  end

  def create
  end

end
