class CreateMinisters < ActiveRecord::Migration[7.0]
  def change
    create_table :ministers do |t|
      t.string :fullname
      t.text :notes
      t.boolean :archive

      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
