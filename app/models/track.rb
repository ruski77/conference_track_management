class Track < ActiveRecord::Base
  attr_accessible :number

  belongs_to :conference

  has_many :session
end
