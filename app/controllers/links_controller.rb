class LinksController < ApplicationController
  before_action :set_link, only: [:show]

  def show
    TrackLinkUsage.perform_later(
      link: @link,
      referer: request.referrer,
      user_agent: request.user_agent
    )

    redirect_to @link.url, status: :moved_permanently
  end

  def create
    @link = Link.find_or_initialize_by(link_params)

    if @link.save
      render json: @link, status: :created, location: @link
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  private

    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:url, :user_id).tap do |hash|
        hash[:user_id] ||= nil
      end
    end
end
