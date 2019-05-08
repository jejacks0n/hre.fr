class Link < ApplicationRecord
  include Hashid::Rails

  validates :url, presence: true, url: true

  def as_json(options = {})
    super(options).merge("id" => to_param)
  end
end
