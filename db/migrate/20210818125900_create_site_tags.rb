class CreateSiteTags < ActiveRecord::Migration[6.1]
  def change
    create_table :site_tags do |t|
      t.references :site, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
