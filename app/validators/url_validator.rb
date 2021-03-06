# from https://stackoverflow.com/questions/7167895/rails-whats-a-good-way-to-validate-links-urls
class UrlValidator < ActiveModel::EachValidator
  def self.valid?(value)
    uri = URI.parse(value)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end

  def validate_each(record, attribute, value)
    unless value.present? && self.class.valid?(value)
      record.errors.add(attribute, "is not a valid URL")
    end
  end
end
