class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :number

      t.timestamps
    end
  end
end
