require File.dirname(__FILE__) + '/../../../../../../spec_helper'
include ::OpenEHR::RM::DataTypes::Text
include ::OpenEHR::AssumedLibraryTypes
include ::OpenEHR::RM::Support::Identification
require 'openehr/am/openehr_profile/data_types/text'
include ::OpenEHR::AM::OpenEHRProfile::DataTypes::Text

describe CCodePhrase do
  before(:all) do
    term_id = TerminologyID.new(:value => 'ICD10')
    occurrences = Interval.new(:upper => 1)
    @c_code_phrase  = CCodePhrase.new(:terminology_id => term_id,
                                      :code_list => ['C92', 'C93'],
                                      :path => 'value/text',
                                      :occurrences => occurrences,
                                      :rm_type_name => 'CodePhrase')
  end

  it 'is an instance of CCodePhrase' do
    @c_code_phrase.should be_an_instance_of CCodePhrase
  end

  it 'terminology_id is ICD10' do
    @c_code_phrase.terminology_id.value.should == 'ICD10'
  end

  it 'code_list is C92, C93' do
    @c_code_phrase.code_list.should == ['C92', 'C93']
  end

  it 'occurrences upper is 1' do
    @c_code_phrase.occurrences.upper.should be 1
  end
end
