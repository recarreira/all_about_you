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
      "<a href='#{link}' class='fc-webicon #{service}' title='#{service}'>#{service}</a>"
    end
    def custom_link(input)
      title = input["title"]
      url = input["url"]

      "<a href='#{url}' title='#{title}'>#{title}</a>"
    end
  end
end

Liquid::Template.register_filter(Jekyll::SocialLinkFilter)
