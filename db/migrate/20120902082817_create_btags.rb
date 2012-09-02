class CreateBtags < ActiveRecord::Migration
  def change
  	 create_table :btags do |t|
      t.string :title
      t.string :tags
      t.timestamps
    end
  end
end
