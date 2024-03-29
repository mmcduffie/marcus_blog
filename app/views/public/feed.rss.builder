xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Marcus McDuffie's Blog"
    xml.description "Marcus McDuffie is a hobbyist programmer from the Traverse City region who hacks on Ruby, Rails, Haskell, Lua, Lisp, C and whatever else he feels like."
    xml.link root_url

    for post in @posts
      xml.item do
        xml.title post.title
        xml.description post.body
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link url_for :only_path => false, :controller => 'public', :action => 'show', :id => post.id
      end
    end
  end
end