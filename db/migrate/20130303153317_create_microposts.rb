class CreateMicroposts < ActiveRecord::Migration
  def self.up
    create_table :microposts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :microposts, :user_id			#on ajoute un index sur user_id pour pouvoir faire une recherche by user_id
  end

  def self.down
  	drop_table :microposts
  end
end
