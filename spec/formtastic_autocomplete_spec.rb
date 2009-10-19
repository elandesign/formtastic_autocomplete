# coding: utf-8
require File.dirname(__FILE__) + '/test_helper'
require File.expand_path(File.join(File.dirname(__FILE__), '../init.rb'))
require 'ruby-debug'

class Task
  
  attr_accessor :id, :status_id, :status
  
  def self.statuses
    [EnumField.new, EnumField.new]
  end
end

class EnumField
  attr_accessor :id, :title
end

describe "Formtastic" do
  
  include ActionView::Helpers::FormHelper
  include ActionView::Helpers::FormTagHelper
  include ActionView::Helpers::FormOptionsHelper
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::ActiveRecordHelper
  include ActionView::Helpers::RecordIdentificationHelper
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::CaptureHelper
  include ActiveSupport
  include ActionController::PolymorphicRoutes

  include Formtastic::SemanticFormHelper

  attr_accessor :output_buffer
  
  def protect_against_forgery?; false; end
  
  before do
    
    @output_buffer = ''

    @task = Task.new
    
    def task_path(o); "/tasks/1"; end
    def tasks_path; "/tasks"; end
    
  end
  
  it "should have included the ElanDesign::Formtastic::Autocomplete module" do
    Formtastic::SemanticFormBuilder.included_modules.should include(ElanDesign::Formtastic::Autocomplete)
  end
  
  it "should render an :as => :enum field as a select input" do
    semantic_form_for @task do |builder|
      concat(
        builder.inputs { 
          concat(builder.input(:status, :as => :enum))
        }
      )
    end
    output_buffer.should have_tag("li.enum select")
  end
  
end