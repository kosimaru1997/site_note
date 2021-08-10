class SitesController < ApplicationController
  def index
  end

  def create
    @site = current_user.sites.new(site_params)
    @site.get_site_info(@site.url)
    if @site.save
      redirect_back(fallback_location: root_path)
    else
    end
  end

  def destroy
  end

  private

  def site_params
    params.require(:site).permit(:url, :note)
  end

end
