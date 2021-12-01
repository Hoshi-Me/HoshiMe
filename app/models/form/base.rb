class Form::Base
  include ActiveModel::Model
  include ActiveModel::Callbacks
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks
  # i18n
  extend ActiveModel::Translation
end
