class User < ActiveRecord::Base
  attr_accessible :description, :name, :profile_img, :user_id

  validates :name,
    :presence => true,
    :uniqueness => true,
    :length => { :maximum => 20 }
end
