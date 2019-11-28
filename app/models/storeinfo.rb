class Storeinfo < ApplicationRecord
  has_many :branchinfos, :dependent => :destroy

  mount_uploader :image, ImageUploader
end
