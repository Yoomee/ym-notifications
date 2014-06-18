class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.text :text

      t.timestamps
    end
  end
end
