class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.references :user, foreign_key: true, null: false
      t.string :url, null: false
      t.string :title
      t.text :image
      t.text :page
      t.text :note

      t.timestamps
    end
    add_index :sites, [:title, :page, :created_at]
  end
end
