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

  describe '#births_for_today' do
    it 'should respond with full list when no option is given' do
      Timecop.freeze('31-10-2116')
      output = FactsByDate::Generator.births_for_today
      expect(output).to be_kind_of Array
      expect(output.size).to eq(274 )
      Timecop.return
    end

    it 'should respond with proper list when size option is given' do
      Timecop.freeze('31-10-2116')
      output = FactsByDate::Generator.births_for_today({:size => 2})
      expect(output).to be_kind_of Array
      expect(output.size).to eq(2)
      Timecop.return
    end
  end

  describe '#births_for_specific_date' do
    it 'should respond with proper list when no option is given' do
      output = FactsByDate::Generator.births_for_specific_date('30-10-2015')
      expect(output).to be_kind_of Array
      expect(output.size).to eq(224)
    end

    it 'should respond with proper list when size option is given' do
      output = FactsByDate::Generator.births_for_specific_date('30-10-2015', { :size => 2 })
      expect(output).to be_kind_of Array
      expect(output.size).to eq(2)
    end
  end
  describe '#deaths_for_today' do
    it 'should respond with full list when no option is given' do
      Timecop.freeze('31-10-2116')
      output = FactsByDate::Generator.deaths_for_today
      expect(output).to be_kind_of Array
      expect(output.size).to eq(106 )
      Timecop.return
    end

    it 'should respond with proper list when size option is given' do
      Timecop.freeze('31-10-2116')
      output = FactsByDate::Generator.deaths_for_today({:size => 2})
      expect(output).to be_kind_of Array
      expect(output.size).to eq(2)
      Timecop.return
    end
  end

  describe '#deaths_for_specific_date' do
    it 'should respond with proper list when no option is given' do
      output = FactsByDate::Generator.deaths_for_specific_date('30-10-2015')
      expect(output).to be_kind_of Array
      expect(output.size).to eq(94)
    end

    it 'should respond with proper list when size option is given' do
      output = FactsByDate::Generator.deaths_for_specific_date('30-10-2015', { :size => 2 })
      expect(output).to be_kind_of Array
      expect(output.size).to eq(2)
    end
  end

  describe '#sources' do
    it 'should respond with proper list' do
      output = FactsByDate::Generator.sources
      expect(output).to be_kind_of Array
      expect(output.size).to eq(27)
    end
  end
end