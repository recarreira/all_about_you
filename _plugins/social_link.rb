module Jekyll
  module SocialLinkFilter

    SOCIAL_URLS = {
      "facebook"      => "https://www.facebook.com/%s",
      "flickr"        => "http://www.flickr.com/photos/%s/",
      "foursquare"    => "https://foursquare.com/%s",
      "github"        => "https://github.com/%s/",
      "googleplus"    => "https://plus.google.com/%s?rel=author",
      "lastfm"        => "http://www.lastfm.com.br/user/%s",
      "linkedin"      => "http://www.linkedin.com/in/%s",
      "quora"         => "http://www.quora.com/%s",
      "stackoverflow" => "http://stackoverflow.com/users/%s/",
      "twitter"       => "http://twitter.com/%s"
    }

    def social_link(input)
      service, username = input
      return "" if username.nil? || username.to_s.empty?

      url = SOCIAL_URLS[service] % username
      "<a href='#{url}' class='fc-webicon #{service}' title='#{service}'>#{service}</a>"
    end
    def custom_link(input)
      title = input["title"]
      url = input["url"]

      "<a href='#{url}' title='#{title}'>#{title}</a>"
    end
  end
end

Liquid::Template.register_filter(Jekyll::SocialLinkFilter)
