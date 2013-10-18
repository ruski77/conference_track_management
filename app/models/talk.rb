class Talk < ActiveRecord::Base
  attr_accessible :duration, :title, :start_time

  belongs_to :session
end
