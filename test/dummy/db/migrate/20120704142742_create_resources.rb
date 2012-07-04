class CreateResources < ActiveRecord::Migration
  
  def change
    create_table :resources do |t|
      t.text :text
    end
  end
  
end
