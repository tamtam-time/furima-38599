class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.references :history,            null: false, foreign_key: true
      t.string     :postcode,           null: false
      t.integer    :area_id,            null: false
      t.string     :municipaldistrict,  null: false
      t.string     :district,           null: false
      t.string     :building
      t.string     :phone,              null: false
      t.timestamps
    end
  end
end
