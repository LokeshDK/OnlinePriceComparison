class Storeinfo < ApplicationRecord
  has_many :branchinfos

  mount_uploader :image, ImageUploader
end
