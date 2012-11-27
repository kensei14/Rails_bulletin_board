class User < ActiveRecord::Base
  attr_accessible :description, :name, :profile_img, :user_id
end
