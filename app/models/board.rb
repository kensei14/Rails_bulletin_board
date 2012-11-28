class Board < ActiveRecord::Base
  attr_accessible :comment, :d_date, :d_time, :id, :title

  validates :title,
    :presence => true,
    :length => { :minimum => 1, :maximum => 100 }
  validates :comment,
    :presence => true
    #:length => { :minimum => 1, :maximum => 300 }
end
