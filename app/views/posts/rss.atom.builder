atom_feed :language => 'en-US' do |feed|
  feed.title "Dipiash. Lorem ipsum dolor..."
  feed.updated @posts.maximum(:created_at)

  @posts.each do |post|
    feed.entry post, {published: post.created_at, updated: post.updated_at} do |entry|
      entry.title post.title
      entry.content "#{create_preview(post.content)}...", type: 'html'
      entry.author "dipiash"
      entry.url post_url(post)
    end
  end
end
