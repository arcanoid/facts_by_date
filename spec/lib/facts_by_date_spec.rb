require 'spec_helper'

describe FactsByDate::Generator do
  describe '#facts_for_today' do
    it 'should respond with full list when no option is given' do
      Timecop.freeze('02-01-2116')
      output = FactsByDate::Generator.facts_for_today
      expect(output).to be_kind_of Array
      expect(output.size).to eq(14)
      Timecop.return
    end

    it 'should respond with proper list when size option is given' do
      output = FactsByDate::Generator.facts_for_today({:size => 2})
      expect(output).to be_kind_of Array
      expect(output.size).to eq(2)
    end
  end

  describe '#facts_for_specific_date' do
    it 'should respond with proper list when no option is given' do
      output = FactsByDate::Generator.facts_for_specific_date('22-12-2015')
      expect(output).to be_kind_of Array
      expect(output.size).to eq(20)
    end

    it 'should respond with proper list when size option is given' do
      output = FactsByDate::Generator.facts_for_specific_date('22-12-2015', { :size => 2 })
      expect(output).to be_kind_of Array
      expect(output.size).to eq(2)
    end
  end
end