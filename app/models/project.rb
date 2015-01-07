class Project < ActiveRecord::Base
  resourcify

  def localized_description
    if I18n.locale == :de
      self.description_de
    else
      self.description # default (English)
    end
  end
end
