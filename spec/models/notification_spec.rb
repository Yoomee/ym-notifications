require 'spec_helper'

describe Notification do
  
  it {should belong_to(:user)}
  it {should validate_presence_of(:user)}
  it {should belong_to(:resource)}
  
  describe do
    
    let(:notification) {FactoryGirl.create(:notification)}
    
    it "should be valid" do
      notification.should be_valid
    end
    
  end
  
end