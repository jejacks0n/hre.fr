class PasswordValidator < ActiveModel::EachValidator
  DEFAULT_COMPLEXITY_REQUIRED = 2
  DEFAULT_MIN_LENGTH = 8

  def self.valid?(password)
    return false if password.nil?

    checks = []
    checks << validate_uppercase(password)
    checks << validate_numerical(password)
    checks << validate_length(password)

    validate_enough_checks(checks, DEFAULT_COMPLEXITY_REQUIRED)
  end

  def self.validate_enough_checks(checks, min)
    checks.length - checks.compact.length >= min
  end

  def self.validate_uppercase(password)
    "requires at least one uppercase letter" unless password =~ /[A-Z]/
  end

  def self.validate_numerical(password)
    "requires at least one number" unless password =~ /[0-9]/
  end

  def self.validate_length(password)
    "requires a length greater than #{DEFAULT_MIN_LENGTH}" unless password.length > DEFAULT_MIN_LENGTH
  end

  def validate_each(record, attribute, value)
    unless value.present? && self.class.valid?(value)
      record.errors.add(attribute, "is not valid")
    end
  end
end
