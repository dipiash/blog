module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def opengraph_config(page_title)
    { og_type: "website",
      og_title: page_title,
      og_description: "Dipiash. Блог о веб разработке и нетолько.",
      og_url: request.original_url
    }
  end

end
