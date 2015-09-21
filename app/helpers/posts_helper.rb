module PostsHelper
  def create_preview(post_content)
    index = post_content =~ /&lt;truncate_text&gt;/ || post_content.length
    post_content[0,index]
  end

  def remove_truncate_text(post_content)
    post_content.gsub!("&lt;truncate_text&gt;", "")
  end
end
