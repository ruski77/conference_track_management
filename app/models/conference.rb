class Conference < ActiveRecord::Base
  attr_accessible :date, :name

  has_many :tracks, :dependent => :destroy
end
