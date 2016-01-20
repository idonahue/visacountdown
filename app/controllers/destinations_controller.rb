class DestinationsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_destination, except: [:create]

  def edit
    user_not_authorized unless current_or_guest_user.destinations.include?(@destination)
  end

  def create
    @destination = Destination.new(destination_params)
    @destination.user = current_or_guest_user

    if @destination.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js
      end
    end
  end

  # PATCH
  def set_latest_entry
    if current_or_guest_user.destinations.include?(@destination)
      if @destination.update(latest_entry_params)
        respond_to do |format|
          format.html { redirect_to root_path }
          format.js
        end
      else
        respond_to do |format|
          format.html { render :edit }
          format.js
        end
      end
    else
      user_not_authorized
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destination
      @destination = Destination.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def destination_params
      params.require(:destination).permit(:zone)
    end

    # Only allow a trusted parameter "white list" through.
    def latest_entry_params
      params.require(:destination).permit(:latest_entry)
    end
end
