class FeedsController < ApplicationController
  # GET /feed
  def index
    # @feed = current_user.follower_feed
    @feed = Feed.all

    render json: @feed
  end
end
