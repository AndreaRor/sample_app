class CreateCommentaires < ActiveRecord::Migration
  def self.up
    create_table :commentaires do |t|
      t.string :contenu
      t.integer :user_id
      t.integer :micropost_id

      t.timestamps
    end
    add_index :commentaires, :user_id
  end
  def self.down
  	drop_table :commentaires
  end
end
