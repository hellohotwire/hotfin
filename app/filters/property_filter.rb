class PropertyFilter
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def filter_properties(properties)
    properties = apply_price_filter(properties)
    properties = apply_home_type_filter(properties)
    properties = apply_beds_filter(properties)
    properties = apply_sort_filter(properties)
    properties
  end

  private

  def apply_price_filter(properties)
    return properties unless min_price.present? && max_price.present?
    properties.by_price(min_price, max_price)
  end

  def apply_home_type_filter(properties)
    return properties unless home_type.present?
    properties.where(home_type: home_type)
  end

  def apply_beds_filter(properties)
    return properties unless beds.positive?
    properties.where(beds: beds)
  end

  def apply_sort_filter(properties)
    case sort_by
    when 'newest'
      properties.newest
    when 'oldest'
      properties.oldest
    when 'price_high_low'
      properties.order(price: :desc)
    when 'price_low_high'
      properties.order(price: :asc)
    else
      properties.newest # default sort option
    end
  end

  def home_type
    Property.home_types[params[:home_type]]
  end

  def min_price
    params[:min_price].present? ? params[:min_price].to_i : 0
  end

  def max_price
    params[:max_price].present? ? params[:max_price].to_i : nil
  end

  def beds
    params[:beds].to_i
  end

  def sort_by
    params[:sort_by]
  end
end
