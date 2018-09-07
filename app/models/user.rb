class User < ApplicationRecord
  class << self

  def from_omniauth(auth_hash)
    binding.pry
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.name = auth_hash['info']['name']
    user.location = get_social_location_for user.provider, auth_hash['info']['location']
    user.image_url = auth_hash['info']['image']
    user.url = get_social_url_for user.provider, auth_hash['info']['urls']
    user.save!
    user
  end


  # For Google  
  # def from_omniauth(auth_hash)
  #   user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
  #   user.name = auth_hash['info']['name']
  #   user.image_url = auth_hash['info']['image']
  #   user.save!
  #   user
  # end

  # begin For Twitter
  # def from_omniauth(auth_hash)

  #   user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
  #   user.name = auth_hash['info']['name']
  #   user.location = auth_hash['info']['location']
  #   user.image_url = auth_hash['info']['image']
  #   user.url = auth_hash['info']['urls'][user.provider.capitalize]

  #   user.save!
  #   user
  # end

  private

  def get_social_location_for(provider, location_hash)
    binding.pry
    case provider
      when 'linkedin'
        location_hash['name']
      else
        location_hash
    end
  end

  def get_social_url_for(provider, urls_hash)
    binding.pry
    case provider
      when 'linkedin'
        urls_hash['public_profile']
      else
        urls_hash[provider.capitalize]
    end
  end

end
end
