class SitesController < ApplicationController
  def index
  end
  
  def create
    @site = current_user.sites.new(site_params)
    begin
      @site.get_site_info(@site.url)
    rescue MetaInspector::RequestError,MetaInspector::ParserError => e
      render 'shared/flash' and return
    end
    
    if @site.save
      redirect_back(fallback_location: root_path)
    else
      render 'shared/errors'
    end
  end

  def show
    @site = Site.find(params[:id])
  end
  
  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update(site_params)
      redirect_to site_path(@site)
    else
      render 'edit'
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
