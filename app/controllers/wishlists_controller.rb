class WishlistsController < ApplicationController
  before_action :authenticate_user!

  def create
    @property = Property.find(params[:property_id])
    unless current_user.properties.include?(@property)
      current_user.properties << @property
      flash[:notice] = "Property added to wishlist successfully."
    else
      flash[:alert] = "Property is already in the wishlist."
    end
    redirect_back fallback_location: root_path
  end

  def destroy

    @property = Property.find(params[:id])
    if current_user.properties.include?(@property)
      current_user.properties.destroy(@property)
      flash[:notice] = "Property removed from wishlist successfully."
    else
      flash[:alert] = "Property is not in the wishlist."
    end
    redirect_back fallback_location: root_path
  end
end
