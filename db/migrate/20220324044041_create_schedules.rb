class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :technician_name
      t.string :location_name
      t.datetime :time
      t.integer :duration
      t.decimal :price
      t.integer :break

      t.timestamps
    end
  end
end
