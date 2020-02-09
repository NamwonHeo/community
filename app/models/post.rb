class Post < ApplicationRecord
  resourcify
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images
  validates :title, presence: true
  validates :content, presence: true
  validate :image_type
  paginates_per 10

  def thumbnail input
    return self.images[input].variant(resize: '300X300!').processed
    # code
  end

  private
  def image_type
  #  if images.attached? == false
  #    errors.add(:images, "are missing!")
  #  end
   images.each do |image|
     if !image.content_type.in?(%('image/jpeg image/png image/jpg'))
       errors.add(:images, 'needs to be a JPEG or PNG')
     end
   end
  end
end
