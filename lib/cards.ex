defmodule Cards do
    @moduledoc"""
        Provides methods for creating and handling a deck of cards
    """

    @doc """
    Returns a list of strings representing the playing cards
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

    @doc """
    Determines wether a ´deck´ contains a given ´card´

    ## Examples
        iex> deck = Cards.create_deck()
        iex> Cards.contains?(deck, "Ace of Spades")
        true
    """
    def contains?(deck, card) do
        Enum.member?(deck, card)
    end
    @doc """
    Divides a deck in a hand and the rest of the deck.
    The `hand_size` argument indicates how many cards the hand will contain.
    
    ## Examples
        iex> deck = Cards.create_deck
        iex> {hand, deck} = Cards.deal(deck,1)
        iex> hand
        ["Ace of Spades"]    
    """

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
