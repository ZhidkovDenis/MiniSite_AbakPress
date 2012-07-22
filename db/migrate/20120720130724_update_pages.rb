class UpdatePages < ActiveRecord::Migration
  def self.up
  	
    drop_table :pages

    create_table :pages do |t|
      t.integer :parentID
      t.string :name
      t.string :urlPage
      t.string :title
      t.text :body

      t.timestamps
    end
  end

  def self.down
    
  end
end
