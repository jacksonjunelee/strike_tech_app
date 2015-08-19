class User < ActiveRecord::Base
  has_many :usertoengines
  has_many :engines, through: :usertoengines

  def self.combine
    all.map { |n| n.username }.join(",")
  end
end
