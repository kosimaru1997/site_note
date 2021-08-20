class UsersController < ApplicationController
  def show   
    user_sites = if params[:tag].nil?
                   current_user.sites
                 else
                   tag = Tag.find(params[:tag])
                   tag.sites.where(user_id: current_user.id)
                 end
    @site = Site.new
    @pagy, @sites = pagy(user_sites.reverse_order, items: 12)
    site_ids = current_user.sites.pluck(:id)
    tag_ids = SiteTag.where(site_id: site_ids).pluck(:tag_id)
    @tags = Tag.where(id: tag_ids)
  end

  def edit
  end
end
