module Jekyll
  module SocialLinkFilter

    SOCIAL_URLS = {
      "facebook"      => "https://www.facebook.com/%s",
      "flickr"        => "http://www.flickr.com/photos/%s/",
      "foursquare"    => "https://foursquare.com/%s",
      "github"        => "https://github.com/%s/",
      "goodreads"     => "http://www.goodreads.com/user/show/%s",
      "googleplus"    => "https://plus.google.com/%s?rel=author",
      "instagram"     => "http://instagram.com/%s",
      "lastfm"        => "http://www.lastfm.com.br/user/%s",
      "linkedin"      => "http://www.linkedin.com/in/%s",
      "quora"         => "http://www.quora.com/%s",
      "stackoverflow" => "http://stackoverflow.com/users/%s/",
      "twitter"       => "http://twitter.com/%s",
      "rss"           => "%s"
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
    def maps_link(location)
      url = "https://maps.google.com.br/maps?q=%s" % location.gsub(" ", "+")
      "<a href='#{url}' title='Google Maps'>#{location}</a>"
    end
  end
end

Liquid::Template.register_filter(Jekyll::SocialLinkFilter)
