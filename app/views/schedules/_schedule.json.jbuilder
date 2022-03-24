json.extract! schedule, :id, :technician_name, :location_name, :time, :duration, :price, :break, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
