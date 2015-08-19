class Engine < ActiveRecord::Base
  self.primary_key = :engineName
  has_many :usertoengines, foreign_key: "engineName"
  has_many :users,through: :usertoengines
  has_many :connections, foreign_key: "engineName"
end
