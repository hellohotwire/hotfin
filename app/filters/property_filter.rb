class PropertyFilter
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def filter_properties(properties)
    properties = properties.by_price(min_price, max_price) if min_price.positive? && max_price.positive?
    properties = properties.where(home_type: home_type) if home_type.present?
    properties = properties.where(beds: beds) if beds.positive?
    properties = properties.newest if sort_by == 'newest'
    properties = properties.oldest if sort_by == 'oldest'
    properties
  end

  def home_type
    Property.home_types[params[:home_type]]
  end

  def min_price
    params[:min_price].to_i
  end

  def max_price
    params[:max_price].to_i
  end

  def beds
    params[:beds].to_i
  end

  def sort_by
    params[:sort_by]
  end
end
