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
    def info_link(input)
      info, detail = input
      return "" if detail.nil? || detail.to_s.empty?

      case info
      when "location"
        url = "https://maps.google.com.br/maps?q=%s" % detail.gsub(" ", "+")
        "<i class='icon-location'></i><a href='#{url}' title='Google Maps'>#{detail}</a>"
      when "email"
        "<i class='icon-#{info}'></i><a href='mailto:#{detail}'>#{detail}</a>"
      else
        "<i class='icon-#{info}'></i>#{detail}"
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::SocialLinkFilter)
