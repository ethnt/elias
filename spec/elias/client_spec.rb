require 'spec_helper'

describe Elias::Client do
  let(:client) do
    Elias::Client.new
  end

  it { client.should be_an_instance_of Elias::Client }
end
