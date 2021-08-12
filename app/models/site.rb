class Site < ApplicationRecord
  belongs_to :user
  validates :url, uniqueness: { scope: :user_id }

  def get_site_info(site_url)
    page = MetaInspector.new(site_url)
    self.title = page.best_title
    self.description = page.best_description
    self.image = page.images.best
  end
  
end
