class AddStartTimeToTalks < ActiveRecord::Migration
  def change
    add_column :talks, :start_time, :string
  end
end
