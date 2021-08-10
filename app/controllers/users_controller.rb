class UsersController < ApplicationController
  def show
    @site = Site.new
    @sites = current_user.sites.reverse_order
  end

  def edit
  end
end
