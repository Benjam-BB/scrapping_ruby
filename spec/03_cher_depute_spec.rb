require_relative '../lib/03_cher_depute'

describe "the get_firstname method" do
    it "should return an array of strings" do
    expect(get_firstname(["Mme Caroline Abadie", "Mme Bérangère Abba", "M. Jean-Félix Acquaviva"])).not_to be_nil
    end
  end


