class AddburlToBookmark < ActiveRecord::Migration
   def change
    add_column :bookmarks, :burl, :string
  end
end
