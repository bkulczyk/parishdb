class CreateParishioners < ActiveRecord::Migration[7.0]
  def change
    create_table :parishioners do |t|
      t.string :firstname
      t.string :lastname
      t.date :birth
      t.string :birth_place
      t.references :place, null: false, foreign_key: true
      t.boolean :death_mark
      t.date :death_date
      t.date :baptism_date
      t.string :baptism_parish
      t.string :baptism_number
      t.string :confirmation_name
      t.string :confirmation_witness
      t.date :confirmation_date
      t.string :confirmation_number
      t.text :notes
      t.boolean :archive

      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
