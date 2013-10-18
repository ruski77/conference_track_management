class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :type

      t.timestamps
    end
  end
end
