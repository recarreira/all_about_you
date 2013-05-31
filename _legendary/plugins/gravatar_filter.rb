# https://github.com/ldesgrange/jekyll-gravatar-filter

require 'digest/md5'

module Jekyll
  module GravatarFilter
    def to_gravatar(input)
      "<img src='http://www.gravatar.com/avatar/#{hash(input)}'/>"
    end

    def to_secure_gravatar(input)
      "<img src='https://secure.gravatar.com/avatar/#{hash(input)}'/>"
    end

    private :hash

    def hash(email)
      email_address = email ? email.downcase.strip : ''
      Digest::MD5.hexdigest(email_address)
    end
  end
end

Liquid::Template.register_filter(Jekyll::GravatarFilter)
