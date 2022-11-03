module ApplicationHelper

  # Returns the i18n string for the enum key
  # Example usage:
  # enum_i18n(OpeningHour, :day, "sunday")
  def enum_i18n(class_name, enum, key)
    I18n.t("activerecord.attributes.#{class_name.model_name.i18n_key}.#{enum.to_s.pluralize}.#{key}")
  end

end