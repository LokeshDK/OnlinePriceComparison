class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  has_many :storeinfos, :dependent => :destroy
  has_many :branchinfos, :dependent => :destroy
  has_many :productinfos, :dependent => :destroy
end
