if Object.const_defined?("Formtastic")
  require 'formtastic_autocomplete'
  Formtastic::SemanticFormBuilder.send(:include, ElanDesign::Formtastic::Autocomplete)
end
