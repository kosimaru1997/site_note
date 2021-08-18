class SitesController < ApplicationController
  def new
    @site = Site.new
  end
  
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
      redirect_to site_path(@site)
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

  def preview

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

  def search
    @pagy, @sites = pagy(Site.search(params[:word], params[:option], params[:sort]), items: 12)
    if @sites.nil?
      @site_count = "0"
    else
      @site_count = @sites.size
    end
    @word = params[:word]
    @option = params[:option]
  end

  private

  def site_params
    params.require(:site).permit(:url, :note)
  end

end
