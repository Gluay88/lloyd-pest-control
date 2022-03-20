json.extract! work_order, :id, :technician_id, :location_id, :time, :duration, :price, :created_at, :updated_at
json.url work_order_url(work_order, format: :json)
