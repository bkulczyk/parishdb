class CreateCharacteristics < ActiveRecord::Migration[7.0]
  def change
    create_table :characteristics do |t|
      t.string :name
      t.text :notes
      t.boolean :archive

      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
