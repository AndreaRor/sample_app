class AddCategorieToMicroposts < ActiveRecord::Migration
	def change
		add_column :microposts, :categorie_id, :integer
	end
end