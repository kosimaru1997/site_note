class Site < ApplicationRecord
  belongs_to :user
  has_many :site_tags, dependent: :destroy
  has_many :tags, through: :site_tags
  validates :url, uniqueness: { scope: :user_id }

  def get_site_info(site_url)
    page = MetaInspector.new(site_url)
    self.title = page.best_title if page.best_title
    self.description = page.best_description if page.best_description
    self.image = page.images.best
  end

  def save_tags(tag_list)
    if self.tags != nil
      tag_recoreds = SiteTag.where(site_id: id)
      tag_recoreds.destroy_all
    end

    tag_list.each do |tag|
      inspect_tag = Tag.where(tag_name: tag).first_or_create
      self.tags << inspect_tag #SiteTag.create(site_id: id, tag_id: tag.id)
    end
  end

  def self.search(word, option, sort, user_id)
    user_sites = User.find(user_id).sites
    relation = if option == "mix"
                user_sites.where("title LIKE ? OR description LIKE ? OR note LIKE ? AND user_id = ?", "%#{word}%","%#{word}%","%#{word}%",user_id)
              elsif option == "title"
                user_sites.where("title LIKE ?", "%#{word}%")
              elsif option == "note"
                user_sites.where("note LIKE ?", "%#{word}%")
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
