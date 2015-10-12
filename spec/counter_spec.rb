require_relative '../counter'

RSpec.describe 'my counting' do
  context "when the input string has a repeated sequence" do
    let(:input_string) { StringIO.new('hehehehehehehe') }
    let(:search_string) { "he" }
    let(:buffer_size) { 5 }

    it 'produces the correct answer' do
      expect(count_occurances_in_file(search_string, input_string, buffer_size)).to eq 7
    end
  end

  context "when the search string has repeated chars" do
    let(:input_string) { StringIO.new('hehehehehehehe') }
    let(:search_string) { "hehe" }
    let(:buffer_size) { 5 }

    it 'produces the correct answer' do
      expect(count_occurances_in_file(search_string, input_string, buffer_size)).to eq 3
    end
  end

  context '' do
    let(:input_string) { StringIO.new('hehehehehehehe') }
    let(:search_string) { "hehe" }
    let(:buffer_size) { 4 }

    it 'produces the correct answer' do
      expect(count_occurances_in_file(search_string, input_string, buffer_size)).to eq 3
    end

  end
end
