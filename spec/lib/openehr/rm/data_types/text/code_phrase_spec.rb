require File.dirname(__FILE__) + '/../../../../../spec_helper'
include OpenEHR::RM::DataTypes::Text
include OpenEHR::RM::Support::Identification

describe CodePhrase do
  before(:each) do
    terminology_id = TerminologyID.new(:value => 'openehr')
    @code_phrase = CodePhrase.new(:code_string => '535',
                                  :terminology_id => terminology_id)
  end

  it 'should be an instance of CodePhrase' do
    @code_phrase.should be_an_instance_of CodePhrase
  end

  it 's code_string should be 535' do
    @code_phrase.code_string.should == '535'
  end

  it 's terminology_id.name should be openehr' do
    @code_phrase.terminology_id.name.should == 'openehr'
  end
end
