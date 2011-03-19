class CreateDishes < ActiveRecord::Migration
  def self.up
    create_table :dishes do |t|
      t.string :name
      t.text :recipe      
      t.boolean :visible, :default => true     
      t.references :category 

      t.timestamps
    end
  end

  def self.down
    drop_table :dishes
  end
end
