require File.dirname(__FILE__) + '/../../../../../spec_helper'
include OpenEHR::RM::Common::Generic

describe Participation do
  before(:each) do
    performer = stub(PartyProxy, :name => 'GEHIRN')
    function = stub(DvText, :value => 'committer')
    mode = stub(DvCodedText, :value => 'present')
    lower = stub(DvDateTime, :value => '2009-10-03T20:33:05')
    time = stub(DvInterval, :lower => lower)
    @participation = Participation.new(:performer => performer,
                                       :function => function,
                                       :mode => mode,
                                       :time => time)
  end

  it 'should be an instance of Participation' do
    @participation.should be_an_instance_of Participation
  end

  it 'should assign performer properly' do
    @participation.performer.name.should == 'GEHIRN'
  end

  it 'should assign function properly' do
    @participation.function.value.should == 'committer'
  end

  it 'should assign mode properly' do
    @participation.mode.value.should == 'present'
  end

  it 'should assign time properly' do
    @participation.time.lower.value.should == '2009-10-03T20:33:05'
  end
end
