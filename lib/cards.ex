defmodule Cards do
    def create_deck do
        values = ["Ace", "Two", "Three", "For", "Five"]
        suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

        for suit <- suits, value <- values do
                "#{value} of #{suit}"
        end
    end

    def shuffle(deck) do
        Enum.shuffle(deck)
    end

    def contains?(deck, card) do
        Enum.member?(deck, card)
    end

    def deal(deck, hand_size) do
        Enum.split(deck, hand_size)
    end

    def save(deck, path) do
        binary = :erlang.term_to_binary(deck)
        File.write(path, binary)
    end
end
