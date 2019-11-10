class Branchinfo < ApplicationRecord
  belongs_to :storeinfo
  has_many :productinfos
end
