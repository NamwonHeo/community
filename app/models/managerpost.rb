class Managerpost < ApplicationRecord
  scope :published_managerposts, -> { where( published: true ).order( created_at: :desc ) }
  resourcify
  belongs_to :user
end
