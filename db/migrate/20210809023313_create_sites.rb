class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.references :user, foreign_key: true, null: false
      t.string :url, null: false
      t.string :title, default: "No Title"
      t.text :description, default: "No Description"
      t.text :image
      t.text :note

      t.timestamps
    end
    add_index :sites, [:title]
    add_index :sites, [:description]
    add_index :sites, [:note]
  end
end
