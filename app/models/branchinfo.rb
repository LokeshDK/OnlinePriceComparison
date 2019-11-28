class Branchinfo < ApplicationRecord
  belongs_to :storeinfo
  has_many :productinfos, :dependent => :destroy
end
