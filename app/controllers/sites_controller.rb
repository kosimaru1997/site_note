class SitesController < ApplicationController
  before_action :authenticate_user!
  before_action :same_user!, only: [:show, :edit, :update, :destroy]

  def new
    @site = Site.new
  end
  
  # def index
  # end
  
  def create
    @site = current_user.sites.new(site_params)
    begin
      @site.get_site_info(@site.url)
    rescue MetaInspector::RequestError,MetaInspector::ParserError => e
      render 'shared/flash' and return
    end

    tag_list = params[:site][:tag].split(",").map(&:strip) if params[:site][:tag]
    @site.save_tags(tag_list) if tag_list
    
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
    tag_list = params[:site][:tags].split(",").map(&:strip)
    @site.save_tags(tag_list)
    if @site.update(site_params)
      redirect_to site_path(@site)
    else
      render 'edit'
    end
  end
  
  def destroy
    Site.find(params[:id]).destroy
    redirect_to root_path
  end

  def search
    @pagy, @sites = pagy(Site.search(params[:word], params[:option], params[:sort], params[:tags], current_user.id), items: 12)
    if @sites.nil?
      @site_count = "0"
    else
      @site_count = @sites.size
    end
    @word = params[:word]
    @option = params[:option]
    @tag = if params[:tags].present?
             Tag.find(params[:tags]).tag_name
           else
             "No Tags"
           end
              
    site_ids = current_user.sites.pluck(:id)
    tag_ids = SiteTag.where(site_id: site_ids).pluck(:tag_id)
    @tags = Tag.where(id: tag_ids)
  end

  private

  def site_params
    params.require(:site).permit(:url, :note)
  end

  def same_user!
    if Site.find(params[:id]).user != current_user
      redirect_to root_path
    end
  end

end
