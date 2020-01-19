class User < ApplicationRecord
  after_create :assign_default_role
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  def assign_default_role
    add_role(:basic)
  end

  def username
    return email.split('@')[0].capitalize
  end
end
