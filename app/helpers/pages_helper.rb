module PagesHelper

  def nav_tab_selected
    links = { home: '' , links: '', faq: '', curriculumvitae: ''}
    selected = 'nav_items__item--selected'

    if current_page?(controller: 'pages', action: 'home')
      links[:home] = selected
      return links
    end

    if current_page?(controller: 'pages', action: 'links')
      links[:links] = selected
      return links
    end

    if current_page?(controller: 'pages', action: 'faq')
      links[:faq] = selected
      return links
    end

    if current_page?(controller: 'pages', action: 'curriculumvitae')
      links[:curriculumvitae] = selected
      return links
    end
  end
end
