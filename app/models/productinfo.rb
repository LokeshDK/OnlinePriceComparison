class Productinfo < ApplicationRecord
  belongs_to :branchinfo
  belongs_to :user
  has_many :categorie
  has_many :order_items
  has_many :reviews, :dependent => :destroy
  validates_presence_of :productname

  mount_uploader :image, ImageUploader
end
