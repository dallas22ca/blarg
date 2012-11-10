module PagesHelper
  def frags
    ["nav", "footer", "content"]
  end
  
  def page_html
    html = @rendered_pattern.html_safe
    
    frags.each do |frag|
      html = html.gsub "{{#{frag}}}", instance_variable_get("@#{frag}")
    end
    
    # $1 = type
    # $2 = ordinal
    # $3 = css id
    # $4 = css class
    
    html = html.gsub(/\{\{(.*):(.*):(.*):(.*)\}\}/) { |w|
      if $2.include? "!"
        section = current_site.sections.find_or_create_by_element_and_ordinal_and_page_id($1, $2, @page.id)
        url = section_path(section, element: $1, ordinal: $2.to_i, page_id: @page.id, format: :js)
        sort = sections_sort_path(section)
      else
        section = current_site.sections.find_or_create_by_element_and_ordinal($1, $2)
        url = section_path(section, element: $1, ordinal: $2.to_i, format: :js)
        sort = sections_sort_path(section)
      end
      
      if $1 == "img"
        output = ""
        
        if section.href != ""
          output += "<a href=\"#{section.href}\">"
        end
        
        output += "<img src=\"#{section.src}\" id=\"#{$3}\" class=\"#{$4} img\" alt=\"#{section.alt}\" data-url=\"#{url}\" data-id=\"#{section.id}\" />"
        
        if section.href != ""
          output += "</a>"
        end
        
      elsif $1 == "section"
        output = "<div id=\"#{$3}\" class=\"#{$4} section\" data-url=\"#{sort}\" data-id=\"#{section.id}\">"
        output += render(section)
        output += "</div>"
      else
        output = "<#{$1} id=\"#{$3}\" class=\"#{$4} rdr\" data-url=\"#{url}\">"
        output += render(section)
        output += "</#{$1}>"
      end
      
      output
    }
    
    html.html_safe
  end
end
