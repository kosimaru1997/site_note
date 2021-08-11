class SitesController < ApplicationController
  def index
  end

  def create
    @site = current_user.sites.new(site_params)
    begin
      @site.get_site_info(@site.url)
    rescue MetaInspector::RequestError,MetaInspector::ParserError => e
      redirect_back(fallback_location: root_path) and return
    end
    
    if @site.save
      redirect_back(fallback_location: root_path)
    else

    end
  end

  def destroy
    Site.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def site_params
    params.require(:site).permit(:url, :note)
  end

end
