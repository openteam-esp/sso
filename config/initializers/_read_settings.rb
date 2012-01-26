Settings.read(Rails.root.join('config', 'settings.yml'))

Settings.defaults Settings.extract!(Rails.env)[Rails.env] || {}
Settings.extract!(:test, :development, :production)

Settings.define 'host',                                       :env_var => 'HOST', :required => true

Settings.define 'hoptoad.api_key',                            :env_var => 'HOPTOAD_API_KEY'
Settings.define 'hoptoad.host',                               :env_var => 'HOPTOAD_HOST'

Settings.define 'mailer.sender_email',                        :env_var => 'SENDER_EMAIL', :required => true

Settings.define 'mailer.smtp.address',               :env_var => 'SMTP_ADDRESS', :required => true
Settings.define 'mailer.smtp.port',                  :env_var => 'SMTP_PORT'
Settings.define 'mailer.smtp.domain',                :env_var => 'SMTP_DOMAIN'
Settings.define 'mailer.smtp.user_name',             :env_var => 'SMTP_USER_NAME'
Settings.define 'mailer.smtp.password',              :env_var => 'SMTP_PASSWORD'
Settings.define 'mailer.smtp.authentication',        :env_var => 'SMTP_AUTHENTICATION'
Settings.define 'mailer.smtp.enable_starttls_auto',  :env_var => 'SMTP_ENABLE_STARTTLS_AUTO'

Settings.resolve!
