require 'spec_helper'

describe Elias::Park do
  describe ".find" do
    let(:mk) { Elias::Park.find("Magic Kingdom") }

    it { mk.should be_an_instance_of Elias::Park }
  end
end
