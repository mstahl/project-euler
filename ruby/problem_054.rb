#!/usr/bin/env ruby -wKU
# 
# In the card game poker, a hand consists of five cards and are ranked, from
# lowest to highest, in the following way:
# 
# High Card: Highest value card.
# One Pair: Two cards of the same value.
# Two Pairs: Two different pairs.
# Three of a Kind: Three cards of the same value.
# Straight: All cards are consecutive values.
# Flush: All cards of the same suit.
# Full House: Three of a kind and a pair.
# Four of a Kind: Four cards of the same value.
# Straight Flush: All cards are consecutive values of same suit.
# Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
# 
# The cards are valued in the order:
# 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.
# 
# If two players have the same ranked hands then the rank made up of the
# highest value wins; for example, a pair of eights beats a pair of fives (see
# example 1 below). But if two ranks tie, for example, both players have a pair
# of queens, then highest cards in each hand are compared (see example 4
# below); if the highest cards tie then the next highest cards are compared,
# and so on.
# 
# The file, poker.txt, contains one-thousand random hands dealt to two players.
# Each line of the file contains ten cards (separated by a single space): the
# first five are Player 1's cards and the last five are Player 2's cards. You
# can assume that all hands are valid (no invalid characters or repeated
# cards), each player's hand is in no specific order, and in each hand there is
# a clear winner.
# 
# How many hands does Player 1 win?

require 'pp'

# class Fixnum
#   @@suits = %w{S C H D}
#   
#   def suit
#     @@suits[self // 13]
#   end
#   
#   def rank
#     case @@ranks[self % 13]
#     when 10
#       'T'
#     when 11
#       'J'
#     when 12
#       'Q'
#     when 13
#       'K'
#     when 1
#       'A'
#     else
#       @@ranks[self % 13].to_s
#     end
#   end
# end

class String
  def card
    value = 0
    self =~ /^([2-9TJQKA])([SCHD])$/i
    case $1.upcase
    when 'T'
      value += 10
    when 'J'
      value += 11
    when 'Q'
      value += 12
    when 'K'
      value += 13
    when 'A'
      value += 1
    else
      value += $1.to_i
    end
    case $2.upcase
    when 'S'
      value += 13 * 0
    when 'C'
      value += 13 * 1
    when 'H'
      value += 13 * 2
    when 'D'
      value += 13 * 3
    end
    
    value
  end
end

def rank(hand)
  # Returns a tuple, sorta, of the hand's rank, the rank(s) of the cards in the
  # formation of the hand, and the highest card in the hand.
  hand_rank = 0
end

player1_wins = 0

IO.readlines('data/poker.txt').map {|x|
  x.split.map {|y|
    y.card
  }
}.map {|y|
  [y[0..4], y[5..10]]
}.each {|row|
  player1 = row[0]
  player2 = row[1]
  if rank(player1) > rank(player2) then
    player1_wins += 1
  end
}

