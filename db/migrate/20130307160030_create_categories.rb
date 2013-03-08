class CreateCategories < ActiveRecord::Migration
	def change 
		create_table :categories do |t|
			t.string :nom
			t.timestamps
		end
		add_index :categories, :nom
	end
end