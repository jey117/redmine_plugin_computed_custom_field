module ComputedCustomField
  class << self
    def patch_models
      models = [
        Enumeration, Group, Issue, Project,
        TimeEntry, User, Version
      ]
      models.each do |model|
        if model.included_modules
                .exclude?(ComputedCustomField::ModelPatch)
          model.send :include, ComputedCustomField::ModelPatch
        end
      end
    end
  end
end

COMPUTED_CUSTOM_FIELD_REQUIRED_FILES = [
  'computed_custom_field/custom_field_patch',
  'computed_custom_field/custom_fields_helper_patch',
  'computed_custom_field/model_patch',
  'computed_custom_field/issue_patch',
  'computed_custom_field/hooks'
]

base_url = File.dirname(__FILE__)
COMPUTED_CUSTOM_FIELD_REQUIRED_FILES.each { |file| require(base_url + '/' + file) }