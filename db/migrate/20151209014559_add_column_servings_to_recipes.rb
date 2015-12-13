class AddColumnServingsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :servings, :integer
  end
end
