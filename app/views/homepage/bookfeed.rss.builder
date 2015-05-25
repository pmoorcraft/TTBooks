#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Tech Talks and Books"
    xml.author "TTBooks"
    xml.description "Videos for tech startup entrepreneurs and investors"
    xml.link "https://www.ttbooks.io"
    xml.language "en"

    for book in @books
      xml.item do
        if book.title
          xml.title book.title
        else
          xml.title ""
        end
        xml.author "TTBooks"
        xml.pubDate book.created_at.to_s(:rfc822)
        xml.link "https://www.ttbooks.io/books/" + book.id.to_s
        xml.guid book.id

        text = book.header
		
        xml.description "<p>" + text + "</p>"

      end
    end
  end
end