class Bookmark < ActiveRecord::Base
  attr_accessible :details, :title,:created_at, :id, :updated_at,:burl
  validates :title, :length => { :minimum => 1,:message=>"Title : Please Enter Title"}
  validates :burl, :format => { :with => /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/,
    :message=>"URL : Invalid URL (ex: http://xyz.com)" }

  
end