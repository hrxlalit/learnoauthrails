class User < ApplicationRecord
  class << self

  #For Github
  def from_omniauth(auth_hash)
     user = find_or_create_by(uid: auth_hash.uid, provider: auth_hash.provider)
     user.name = auth_hash.info.name
     user.email = auth_hash.info.email
     user.url = auth_hash.extra.raw_info.html_url
     user.location = auth_hash.extra.raw_info.location
     user.image_url = auth_hash.info.image
     user.oauth_token = auth_hash.credentials.token
     user.save!
     user
  end

  #For Linkedin
  def from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash.uid, provider: auth_hash.provider)
    user.name = auth_hash.info.name
    user.url = auth_hash.info.urls.public_profile
    user.location = auth_hash.extra.raw_info.location.name
    user.image_url = auth_hash.info.image
    user.oauth_token = auth_hash.credentials.token
    user.save!
    user
  end


  #For Google  
  def from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash.uid, provider: auth_hash.provider)
    user.name = auth_hash.info.name
    user.email = auth_hash.info.email
    user.url = auth_hash.extra.raw_info.html_url
    user.location = auth_hash.extra.raw_info.location
    user.image_url = auth_hash.info.image
    user.oauth_token = auth_hash.credentials.token
    user.save!
    user
  end

  #For Twitter
  def from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash.uid, provider: auth_hash.provider)
    user.name = auth_hash.info.name
    user.email = auth_hash.info.email
    user.url = auth_hash.extra.raw_info.html_url
    user.location = auth_hash.extra.raw_info.location
    user.image_url = auth_hash.info.image
    user.oauth_token = auth_hash.credentials.token
    user.save!
    user
  end




end
end
