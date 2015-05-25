#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Tech Talks and Books"
    xml.author "TTBooks"
    xml.description "Videos for tech startup entrepreneurs and investors"
    xml.link "https://www.ttbooks.io"
    xml.language "en"

    for video in @videos
      xml.item do
        if video.title
          xml.title video.title
        else
          xml.title ""
        end
        xml.author "TTBooks"
        xml.pubDate video.created_at.to_s(:rfc822)
        xml.link "https://www.ttbooks.io/videos/" + video.id.to_s
        xml.guid video.id

        text = video.description
		
        xml.description "<p>" + text + "</p>"

      end
    end
  end
end