json.extract! invoice, :id, :date, :client, :tax, :saleperson, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
