module PropertiesHelper
  def property_status_label(property)
    case property.status
    when 'for_sale'
      content_tag :span, property.status.humanize, class: "rounded bg-red-500 text-red-100 font-medium px-2 py-1 text-xs dark:bg-red-500/20 dark:text-red-300"
    when 'pending'
       content_tag :span, property.status.humanize, class: "rounded bg-orange-500 text-orange-100 font-medium px-2 py-1 text-xs dark:bg-orange-500/20 dark:text-orange-300"
    when 'sold'
       content_tag :span, property.status.humanize, class: "rounded bg-yellow-300 text-yellow-800 font-medium px-2 py-1 text-xs dark:text-yellow-300 dark:bg-yellow-500/20"
    end
  end
end
