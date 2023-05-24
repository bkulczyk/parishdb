class CreateJoinTableCharacteristicsParishioners < ActiveRecord::Migration[5.2]
  def change
    create_join_table :characteristics, :parishioners do |t|
      t.index [:characteristic_id, :parishioner_id], name: 'charpar'
      t.index [:parishioner_id, :characteristic_id], name: 'parchar'
    end
  end
end