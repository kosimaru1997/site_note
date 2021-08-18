class Tag < ApplicationRecord
  has_many :site_tags
  has_many :sites, through: :site_tags
end
