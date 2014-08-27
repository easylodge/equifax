ActiveRecord::Schema.define do
self.verbose = false

  create_table :veda_credit_requests do |t|
    t.integer :application_id
    t.text :xml
    t.text :access
    t.text :service
    t.text :entity
    t.text :bureau_reference
    t.text :enquiry
    t.timestamps
  end

  create_table :veda_credit_responses  do |t|
    t.text :headers
    t.integer :code
    t.text :xml
    t.boolean :success
    t.integer :request_id
    t.timestamps
  end
end
