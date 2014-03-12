class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string    :origin
      t.string    :destination
      t.date      :depart_date
      t.time      :depart_time_1
      t.time      :depart_time_2
      t.text    :comments
      t.timestamps
    end
  end
end
