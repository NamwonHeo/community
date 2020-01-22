class Post < ApplicationRecord
  resourcify
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images
  validates :title, presence: true
  validates :content, presence: true
  validate :image_type

  def thumbnail input
    return self.images[input].variant(resize: '300x300!').processed
    # code
  end

  private
  def image_type
  #  if images.attached? == false
  #    errors.add(:images, "are missing!")
  #  end
   images.each do |image|
     if !image.content_type.in?(%('image/jpeg image/png'))
       errors.add(:images, 'needs to be a JPEG or PNG')
     end
   end
  end
end
