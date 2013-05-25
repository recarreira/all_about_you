module Jekyll
  module SocialLinkFilter
    def social_link(input)
      service, username = input

      return "" if username.nil?

      if service == "twitter"
        link = "http://twitter.com/#{username}"
      elsif service == "github"
        link = "https://github.com/#{username}/"
      end
      "<a href='#{link}' title='#{service}'>#{service}</a>"
    end
  end
end

Liquid::Template.register_filter(Jekyll::SocialLinkFilter)