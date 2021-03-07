require 'spec_helper'

describe LookAndSay do
  before :all do
    @look_and_say = LookAndSay.new
  end

  describe '#create_sequence' do
    let(:look_and_say_sequences) { { 3 => %w[1 11 21], 5 => %w[1 11 21 1211 111221] } }

    it 'returns the correct sequence' do
      look_and_say_sequences.each do |length, sequence|
        expect(@look_and_say.create_sequence(length)).to eq(sequence)
      end
    end

    it 'returns the correct number of elements in a sequence' do
      3.upto(5) do |num|
        expect(@look_and_say.create_sequence(num).length).to eq(num)
      end
    end

    it 'returns the correct sequence at zero' do
      expect(@look_and_say.create_sequence(0)).to eq([])
    end
  end

  describe '#count_next_item' do
    let(:correct_options) { { '11': '21', '1211': '111221', '1113213211': '31131211131221' } }
    let(:incorrect_options) { { '11': '1211', '1211': '13131', '1113213211': '321321212131' } }

    it 'returns the correct result' do
      correct_options.each do |current_item, next_item|
        expect(@look_and_say.count_next_item(current_item)).to eq(next_item)
      end
    end

    it 'returns incorrect result' do
      incorrect_options.each do |current_item, next_item|
        expect(@look_and_say.count_next_item(current_item)).not_to eq(next_item)
      end
    end
  end
end
