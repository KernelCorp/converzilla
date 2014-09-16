json.set! :id, inquire.id.to_s
json.extract! inquire, :email, :phone, :name, :status, :created_at
json.set! :sort, inquire.created_at.to_i
json.url inquire_url(inquire, format: :json)