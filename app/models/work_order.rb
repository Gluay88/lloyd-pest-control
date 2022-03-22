class WorkOrder < ApplicationRecord
  belongs_to :technician
  belongs_to :location
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row| 
        self.find_or_create_by(id: row["id"]) do |workorder|
        workorder.technician_id = row["technician_id"]
        workorder.location_id = row["location_id"]
        workorder.time = row["time"]
        workorder.duration = row["duration"]
        workorder.price = row["price"]
        end  
    end
  end

  def self.to_csv
    attributes = %w{id technician_id location_id time duration price}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |workorder| 
        csv << workorder.attributes.values_at(*attributes)
      end
    end
  end
end
