require 'spec_helper'

describe Elias::Parks do
  describe ".find" do
    let(:mk) { Elias::Park.find('magic-kingdom') }

    it { mk.should be_an_instance_of Elias::Park }
  end
end
