class FormtasticAutocompleteGenerator < Rails::Generator::Base
  
  def manifest
    record do |m|
      m.directory 'public/stylesheets'
      m.file 'autocomplete.css', 'public/stylesheets/autocomplete.css'
      m.readme 'README'
    end
  end
end