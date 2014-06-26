# For gem developer:
# Create file called 'dev_veda_access.yml' in your project root with the following
#
# url: 'https://ctaau.vedaxml.com/cta/sys1'
# access_code: 'your access code'
# password: 'your password'
# subscriber_id: 'your subscriber id'
# security_code: 'your security code'
# request_mode: 'test'
#
# run 'bundle console'and then
# load 'seed.rb' to load this seed data

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => ':memory:',
  )
require_relative 'spec/schema'


dev_config = YAML.load_file('dev_config.yml')
@veda_url = dev_config["url"]
@access_code = dev_config["access_code"]
@password = dev_config["password"]
@subscriber_id = dev_config["subscriber_id"]
@security_code = dev_config["security_code"]
@request_mode = dev_config["request_mode"]

@access_hash = 
              {
                :url => @veda_url,
                :access_code => @access_code,
                :password => @password,
                :subscriber_id => @subscriber_id,
                :security_code => @security_code,
                :request_mode => @request_mode
                }

@product_hash = 
              {
                :service_code => "VDA001",
                :service_code_version => 'V00',
                :request_version => '1.0',
                :product_name => "vedascore-financial-consumer-1.1",
                :summary => "yes"
              }

@entity_hash = 
              {
                :family_name => 'Verry',
                :first_given_name => 'Dore',
                :employer => 'Veda',
                :address_type => 'residential-current',
                :street_name => "Arthur",
                :suburb => "North Sydney",
                :state => "NSW",
                :gender_type => 'male'
              }

@enquiry_hash =
              {
                :role => 'principal',
                :enquiry_type => 'credit-application',
                :account_type_code => 'LC',
                :currency_code => 'AUD',
                :enquiry_amount => '5000',
                :client_reference => '123456789'
              }

@bureau_reference = '186492371'              

@req = VedaCredit::Request.create(access: @access_hash, product: @product_hash, entity: @entity_hash, enquiry: @enquiry_hash)
@post = @req.post
@res = VedaCredit::Response.create(xml: @post.body, headers: @post.header, code: @post.code, success: @post.success?, request_id: @req.id)

# puts 'Seed objects'
# puts '@req, Request object with data'
# puts '@post, Raw response'
# puts '@res, Response object with data'

# puts "@veda_url, Veda url: #{@veda_url} - if nil update dev_veda_access.yml with your details"
# puts "@access_code, Veda access code: #{@access_code} - if nil update dev_veda_access.yml with your details"
# puts "@password, Veda password: #{@password} - if nil update dev_veda_access.yml with your details"
# puts "@subscriber_id, Veda Subscriber id: #{@subscriber_id} - if nil update dev_veda_access.yml with your details"
# puts "@security_code, Veda Security Code: #{@security_code} - if nil update dev_veda_access.yml with your details"
# puts "@request_mode, Veda Request mode: #{@request_mode} - if nil update dev_veda_access.yml with your details"