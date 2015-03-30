class Project < ActiveRecord::Base
  resourcify
  translates :description, :fallbacks_for_empty_translations => true

  def description_preview
    description.truncate(BP_CONFIG['project_preview_sign_length']).bbcode_to_html_with_formatting unless description.nil?
  end

  def description_with_bbcode_and_formatting
    description.bbcode_to_html_with_formatting unless description.nil?
  end

end
