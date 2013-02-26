class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
     # t.integer "subject_id" 
      t.references :page
      t.string "name"
      t.integer "position"
      t.string "content_type"
      t.boolean "visible", :default => false 	 
      t.text "content" 
      t.timestamps
    end
      add_index("sections", "page_id")
  end
end
