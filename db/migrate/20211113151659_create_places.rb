class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.references :street, null: false, foreign_key: true
      t.string :address
      t.text :notes
      t.boolean :archive

      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
