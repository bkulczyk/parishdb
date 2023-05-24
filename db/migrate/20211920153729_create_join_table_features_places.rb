class CreateJoinTableFeaturesPlaces < ActiveRecord::Migration[5.2]
  def change
    create_join_table :features, :places do |t|
      t.index [:feature_id, :place_id]
      t.index [:place_id, :feature_id]
    end
  end
end