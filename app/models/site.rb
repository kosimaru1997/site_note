class Site < ApplicationRecord
  belongs_to :user
  has_many :site_tags
  has_many :tags, through: :site_tags
  validates :url, uniqueness: { scope: :user_id }

  def get_site_info(site_url)
    page = MetaInspector.new(site_url)
    self.title = page.best_title if page.best_title
    self.description = page.best_description if page.best_description
    self.image = page.images.best
  end

  def self.search(word, option, sort)
    relation = if option == "mix"
                Site.where("title LIKE ? OR description LIKE ? OR note LIKE ?", "%#{word}%","%#{word}%","%#{word}%")
              elsif option == "title"
                Site.where("title LIKE ?", "%#{word}%")
              elsif option == "note"
                Site.where("note LIKE ?", "%#{word}%")
              else
                return
              end

    sites = if sort == "new"
              relation.order(created_at: "DESC")
            else
              relation.order(created_at: "ASC")
            end    
  end
  
end
