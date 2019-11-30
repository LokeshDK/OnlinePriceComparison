class Productinfo < ApplicationRecord
  belongs_to :branchinfo
  belongs_to :user
  has_many :categorie
  validates_presence_of :productname

  mount_uploader :image, ImageUploader
end
