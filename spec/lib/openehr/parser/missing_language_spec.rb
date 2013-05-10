# ticket 180
require File.dirname(__FILE__) + '/../../../spec_helper'
require File.dirname(__FILE__) + '/parser_spec_helper'

describe ADLParser do
  context 'Missing language' do
    before(:all) do
      @archetype = adl14_archetype('adl-test-entry.missing_language.test.adl')
    end

    it 'is an instance of Archetype' do
      @archetype.should be_an_instance_of OpenEHR::AM::Archetype::Archetype
    end

    it 'original language is alternated from primary language of ontology section' do
      @archetype.original_language.code_string.should == 'zh'
    end
  end
end

