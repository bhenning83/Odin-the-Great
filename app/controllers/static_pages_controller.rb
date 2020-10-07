class StaticPagesController < ApplicationController
  require 'flickr'

  def index
    flickr = Flickr.new ENV['FLICKR_API_KEY'], ENV['FLICKR_SHARED_SECRET']

    if params[:flickr_id]
      begin
        @photos = flickr.people.getPublicPhotos(user_id: params[:flickr_id])
      rescue => exception
        flash.now.notice = 'ID not recognized'
      end
    end
  end

end
