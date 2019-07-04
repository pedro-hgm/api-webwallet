if Rails.env.development?
  AUTH_DETAILS = YAML.load_file("#{Rails.root}/config/authentication_details.yml")
end
