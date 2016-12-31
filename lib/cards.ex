defmodule Cards do
    @moduledoc"""
        Provides methods for creating and handling a deck of cards
    """

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

    def load(path) do
        case File.read(path) do
            {:ok, binary} -> :erlang.binary_to_term(binary)
            {:error, _reason} -> "This file does not even exist in your wildest dreams..."
        end    
    end

    def create_first_hand(hand_size) do
        create_deck |> shuffle |> deal(hand_size)
    end
end
