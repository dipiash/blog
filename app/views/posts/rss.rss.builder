#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Dipiash. Блог о веб разработке и нетолько"
    xml.author "Dipiash"
    xml.description "Блог о веб разработке и нетолько"
    xml.link "#{root_url}"
    xml.language "en"

    for post in @posts
      xml.item do
        if post.title
          xml.title post.title
        else
          xml.title ""
        end
        xml.author "dipiash"
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link "#{root_url}" + post.id.to_s
        xml.guid post.id

        xml.description "<p>" + "#{create_preview(post.content)}" + "...</p>"
      end
    end
  end
end
