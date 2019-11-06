class Productinfo < ApplicationRecord
  belongs_to :branchinfo
  has_many :categorie
end
