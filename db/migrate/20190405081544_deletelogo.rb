class Deletelogo < ActiveRecord::Migration[5.2]
  def change
    change_table :companies do |t|
    t.remove :logo
  end
  end
end
