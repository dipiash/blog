module PostsHelper
  def create_preview(post_content)
    index = post_content =~ /&lt;truncate_text&gt;/ || post_content.length
    post_content[0,index]
  end
end
