require 'spec_helper'

describe Elias::Client do
  let(:client) do
    Elias::Client.new(:verbose => true)
  end

  it { client.should be_an_instance_of Elias::Client }
  it { client.client[:verbose].should be_true }
end
