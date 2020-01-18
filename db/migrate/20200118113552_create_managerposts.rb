class CreateManagerposts < ActiveRecord::Migration[5.2]
  def change
    create_table :managerposts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :content
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
