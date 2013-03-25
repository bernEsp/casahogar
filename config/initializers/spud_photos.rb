if Rails.env.production? 
  Spud::Photos.configure do |config|
    config.paperclip_storage = :s3
    config.s3_credentials = {
        :bucket => ENV['S3_BUCKET_NAME'],
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_ACCESS_KEY_SECRET']
    }
  end
end
