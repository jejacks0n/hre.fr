class LinkUsesController < ApplicationController
  before_action :set_link

  # GET /links
  def index
    @uses = @link.uses

    render json: @uses
  end

  private

    def set_link
      @link = Link.find(params[:link_id].gsub('+', ''))
    end
end
