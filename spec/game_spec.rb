require_relative '../lib/game.rb'
require_relative '../lib/word.rb'

describe Game do
  let(:game) do
    Game.new(["ruby"])
  end

  describe '#guesses' do
    it 'returns the number of guesses left, starting at 10' do
      expect(game.guesses()).to eq(10)
    end
  end

  describe '#guess' do
    it 'decrements the number of guesses if guess is incorrect' do
      guesses = game.guesses()
      game.guess("z")
      expect(game.guesses()).to eq(guesses - 1)
    end

    it 'does not decrement the number of guesses if letter is found' do
      guesses = game.guesses()
      game.guess("r")
      expect(game.guesses()).to eq(guesses)
    end

    it 'does not decrement guesses for duplicate wrong guesses' do
      game.guess("z")
      guesses = game.guesses()
      game.guess("z")
      expect(game.guesses()).to eq(guesses)
    end

    it 'does not decrement guesses for duplicate right guesses' do
      game.guess("r")
      guesses = game.guesses()
      game.guess("r")
      expect(game.guesses()).to eq(guesses)
    end
  end

  describe '#over?' do
    it 'returns false if game is not over yet' do
      expect(game.over?()).to eq(false)
    end

    it 'returns false if word is guessed' do
      'ruby'.split('').each do |letter|
        game.guess(letter)
      end
      expect(game.over?()).to eq(true)
    end

    it 'returns false if turns exhausted' do
      '!@#$%^&*()'.split('').each do |letter|
        game.guess(letter)
      end
      expect(game.over?()).to eq(true)
    end
  end

  describe '#over_message()' do
    it 'returns empty string if game is not over yet' do
      expect(game.over_message()).to eq("")
    end

    it 'returns "Winner!" if word is guessed' do
      'ruby'.split('').each do |letter|
        game.guess(letter)
      end
      expect(game.over_message()).to eq("Winner!")
    end

    it 'returns "Better luck next time!" if turns exhausted' do
      '!@#$%^&*()'.split('').each do |letter|
        game.guess(letter)
      end
      expect(game.over_message()).to include("Better luck next time!")
    end
  end

end
