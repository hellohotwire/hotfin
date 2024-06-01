class WishlistsController < ApplicationController
  before_action :authenticate_user!

  def create
    @property = Property.find(params[:property_id])

    unless current_user.properties.include?(@property)
      current_user.properties << @property
    end

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: root_path }
    end
  end

  def destroy
    @property = Property.find(params[:id])

    if current_user.properties.include?(@property)
      current_user.properties.destroy(@property)
    end

     respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: root_path }
    end
  end
end
