require File.dirname(__FILE__) + '/../../../../../spec_helper'
include OpenEHR::RM::Common::Archetyped
include OpenEHR::RM::DataTypes::Text
include OpenEHR::RM::Support::Identification

describe Locatable do
  before(:each) do
    name = DvText.new(:value => 'problem/SOAP')
    link = stub(Set, :size => 10, :empty? => false)
    uid = UIDBasedID.new(:value => 'ehr::localhost/3030')
    archetype_id = ArchetypeID.new(:value =>
                           'openEHR-EHR-SECTION.physical_examination.v2')
    archetype_details = stub(Archetyped, :rm_version =>  '1.2.4',
                             :archetype_id => archetype_id)
    feeder_audit = stub(FeederAudit, :system_id => 'MAGI')
    @locatable = Locatable.new(:archetype_node_id => 'at001',
                               :name => name,
                               :links => link,
                               :uid => uid,
                               :feeder_audit => feeder_audit,
                               :archetype_details => archetype_details)
  end

  it 'should be_an_instance_of Locatable' do
    @locatable.should be_an_instance_of Locatable
  end

  it 'archetype_node_id should be at001' do
    @locatable.archetype_node_id.should == 'at001'
  end

  it 'is_archetype_root? should be true' do
    @locatable.is_archetype_root?.should be_true
  end

  it 'is_archetype_root? should be false when archetype_details is nil' do
    @locatable.archetype_details = nil
    @locatable.is_archetype_root?.should be_false
  end

  it 'link size should be 10' do
    @locatable.links.size.should == 10
  end

  it 'name.value should problem/soap' do
    @locatable.name.value.should == 'problem/SOAP'
  end

  it 'uid.value should be ehr::localhost/3030' do
    @locatable.uid.value.should == 'ehr::localhost/3030'
  end

  it 'archetype_details.rm_version should be 1.2.4' do
    @locatable.archetype_details.rm_version.should == '1.2.4'
  end

  it 'feeer_audit.system_id should MAGI' do
    @locatable.feeder_audit.system_id.should == 'MAGI'
  end

  it 'concept should be physical_examination' do
    @locatable.concept.value.should == 'physical_examination'
  end

  it 'should raise ArgumentError with nil archetype_node_id' do
    lambda {
      @locatable.archetype_node_id = nil
    }.should raise_error ArgumentError
  end

  it 'should raise ArgumentError with nil name' do
    lambda {
      @locatable.name = nil
    }.should raise_error ArgumentError
  end

  it 'should raise ArgumentError with empty links' do
    lambda {
      @locatable.links = Set.new
    }.should raise_error ArgumentError
  end

  it 'should raise ArgumentError Archetyped invalid' do
    @locatable.archetype_details = nil
    lambda {
      @locatable.concept
    }.should raise_error ArgumentError
  end
end
