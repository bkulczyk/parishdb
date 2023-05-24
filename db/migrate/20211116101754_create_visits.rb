class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.date :issue
      t.references :parishioner, null: false, foreign_key: true
      t.references :minister, null: false, foreign_key: true
      t.boolean :eucharist
      t.boolean :confession
      t.boolean :anointing
      t.text :notes

      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
