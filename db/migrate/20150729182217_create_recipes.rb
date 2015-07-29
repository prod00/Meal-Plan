class CreateRecipes < ActiveRecord::Migration
  def up
    create_table :recipes do |t|
      t.string :name
      t.string :link
      t.string :key_ingrediants 
    
    end
  end
  def down
    drop_table :recipes
  end
end
