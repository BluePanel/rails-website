class Project < ActiveRecord::Base
  resourcify
  translates :description, :fallbacks_for_empty_translations => true

end
