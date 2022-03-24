class Schedule < ApplicationRecord
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row| 
            self.find_or_create_by(id: row["id"]) do |schedule|
            schedule.technician_name = row["technician_name"]
            schedule.location_name = row["location_name"]
            schedule.time = row["time"]
            schedule.duration = row["duration"]
            schedule.price = row["price"]
            schedule.break = row["break"]
            end  
        end
    end 
    
    def self.to_csv
        attributes = %w{id technician_name location_name time duration price break}
        CSV.generate(headers: true) do |csv|
          csv << attributes
          all.each do |schedule| 
            csv << schedule.attributes.values_at(*attributes)
          end
        end
    end
end
