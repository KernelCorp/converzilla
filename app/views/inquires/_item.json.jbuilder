json.set! :id, inquire.id.to_s
json.extract! inquire, :email, :phone, :name, :status
json.url inquire_url(inquire, format: :json)