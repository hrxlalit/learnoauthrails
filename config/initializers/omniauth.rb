OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
   provider :twitter, 'Bxqb39XPwBxS8BKDe1jqFrm2X', 'a5KWC5eXaT3VK457fW10rdTIqRs1R2fkO4nicTAVjLg80mAwGG'
   provider :facebook, '299527737515598', '90572ad4431754b2f4eba133170a0b36', scope: 'public_profile', info_fields: 'id,name,link'
   provider :google_oauth2, '693679224083-3rmvfur0vec8627l284oj3u7lv9tirto.apps.googleusercontent.com', 'r9am9uw3EF7hCIedJdMyOP69', scope: 'profile', image_aspect_ratio: 'square', image_size: 48, access_type: 'online', name: 'google'
   provider :linkedin, '814pndjvgfo07w', 'TXxj1xOX6B4Uj78J',scope: 'r_basicprofile',fields: ['id', 'first-name', 'last-name', 'location', 'picture-url', 'public-profile-url']
end
