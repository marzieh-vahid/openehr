require File.dirname(__FILE__) + '/../../../../../spec_helper'
include OpenEHR::RM::Common::Archetyped
include OpenEHR::RM::DataTypes::Text
include OpenEHR::RM::DataTypes::URI

describe Link do
  before(:each) do
    @link = Link.new(:meaning => DvText.new(:value => 'generic'),
                     :type => DvText.new(:value => 'problem'),
                     :target => DvEhrUri.new(:value => 'ehr://test'))
  end

  it 'should be an instance of Link' do
    @link.should be_an_instance_of Link
  end

  it 'meaning should be generic' do
    @link.meaning.value.should == 'generic'
  end

  it 'target should be ehr://test' do
    @link.target.value.should == 'ehr://test'
  end

  it 'should raise ArgumentError with nil meaning' do
    lambda {
      @link.meaning = nil
    }.should raise_error ArgumentError
  end

  it 'should raise ArgumentError with nil type' do
    lambda {
      @link.type = nil
    }.should raise_error ArgumentError
  end

  it 'should raise ArgumentError with nil target' do
    lambda {
      @link.target = nil
    }.should raise_error ArgumentError
  end
end
