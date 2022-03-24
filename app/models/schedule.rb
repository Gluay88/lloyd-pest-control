class Schedule < ApplicationRecord
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row| 
            self.find_or_create_by(id: row["id"]) do |schedule|
            schedule.technician_name = row["technician"]
            schedule.location_name = row["location"]
            schedule.time = row["time"]
            schedule.duration = row["duration"]
            schedule.price = row["price"]
            schedule.break = row["break"]
            end  
        end
    end   
end
