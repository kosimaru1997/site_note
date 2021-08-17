class UsersController < ApplicationController
  def show
    @site = Site.new
    @pagy, @sites = pagy(current_user.sites.reverse_order, items: 9)
  end

  def edit
  end
end
