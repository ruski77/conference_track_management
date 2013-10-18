class Session < ActiveRecord::Base
  attr_accessible :type

  has_many :talk

  belongs_to :track
end
