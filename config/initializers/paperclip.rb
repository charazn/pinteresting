Paperclip.interpolates(:s3_sg_url) do |att, style| 
  "#{att.s3_protocol}://s3-#{ENV['AWS_S3_REGION']}.amazonaws.com/#{att.bucket_name}/#{att.path(style)}"
end