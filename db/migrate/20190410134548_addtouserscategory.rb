class Addtouserscategory < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :category_id, :integer
  end
end
