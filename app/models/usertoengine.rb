class Usertoengine < ActiveRecord::Base
  belongs_to :user
  belongs_to :engine, foreign_key: "engineName"

end
