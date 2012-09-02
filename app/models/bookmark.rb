class Bookmark < ActiveRecord::Base
  attr_accessible :details, :title,:created_at, :id, :updated_at
  
end
