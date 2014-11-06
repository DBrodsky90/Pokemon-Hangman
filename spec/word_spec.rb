require_relative '../lib/word.rb'

describe Word do
  let(:word) do
    Word.new('cyanide')
  end

  describe '#try' do
    it 'returns false if letter is not found' do
      expect(word.try('z')).to eq(false)
    end

    it 'returns true if letter is found' do
      expect(word.try('n')).to eq(true)
    end
  end

  describe '#found' do
    it 'returns false if none of the letters are guessed' do
      expect(word.found?()).to eq(false)
    end

    it 'returns false if some of the letters are unguessed' do
      'cand'.split('').each do |letter|
        word.try(letter)
      end
      expect(word.found?()).to eq(false)
    end

    it 'returns true if all letters are guessed' do
      'cyanide'.split('').each do |letter|
        word.try(letter)
      end
      expect(word.found?()).to eq(true)
    end
  end

  describe '#render' do
    it 'returns underscores if none of the letters are guessed' do
      expect(word.render().count('_')).to eq(7)
    end

    it 'reveals guessed letters' do
      'cand'.split('').each do |letter|
        word.try(letter)
      end
      expect(word.render().count('_')).to eq(3)
    end

    it 'works when all letters are guessed' do
      'cyanide'.split('').each do |letter|
        word.try(letter)
      end
      expect(word.render().include?('c')).to eq(true)
      expect(word.render().include?('y')).to eq(true)
      expect(word.render().include?('a')).to eq(true)
      expect(word.render().include?('n')).to eq(true)
      expect(word.render().include?('i')).to eq(true)
      expect(word.render().include?('d')).to eq(true)
      expect(word.render().include?('e')).to eq(true)
    end
  end
end
