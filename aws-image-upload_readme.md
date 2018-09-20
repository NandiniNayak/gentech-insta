https://docs.aws.amazon.com/general/latest/gr/rande.html
https://medium.com/cedarcode/rails-5-2-credentials-9b3324851336

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    :aws_access_key_id => Rails.application.credentials.amazons3[:access_key_id],
    :aws_secret_access_key => Rails.application.credentials.amazons3[:secret_access_key],
    :region  => 'ap-southeast-2'                 # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'gighelp'                                      # required
  config.fog_public     = false                                                 # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
end
