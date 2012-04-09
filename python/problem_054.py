#!/usr/bin/python
# -*- coding: utf-8 -*-
# 
# In the card game poker, a hand consists of five cards and are ranked, from
# lowest to highest, in the following way:
# 
# High Card: Highest value card.
# 
# One Pair: Two cards of the same value.
# 
# Two Pairs: Two different pairs.
# 
# Three of a Kind: Three cards of the same value.
# 
# Straight: All cards are consecutive values.
# 
# Flush: All cards of the same suit.
# 
# Full House: Three of a kind and a pair.
# 
# Four of a Kind: Four cards of the same value.
# 
# Straight Flush: All cards are consecutive values of same suit.
# 
# Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
# 
# The cards are valued in the order:
# 
# 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.
# 
# If two players have the same ranked hands then the rank made up of the
# highest value wins; for example, a pair of eights beats a pair of fives (see
# example 1 below). But if two ranks tie, for example, both players have a pair
# of queens, then highest cards in each hand are compared (see example 4
# below); if the highest cards tie then the next highest cards are compared,
# and so on.
# 
# Consider the following five hands dealt to two players:
# 
# Hand      Player 1        Player 2        Winner
# 1     5H 5C 6S 7S KD
# Pair of Fives
#   2C 3S 8S 8D TD
# Pair of Eights
#   Player 2
# 2     5D 8C 9S JS AC
# Highest card Ace
#   2C 5C 7D 8S QH
# Highest card Queen
#   Player 1
# 3     2D 9C AS AH AC
# Three Aces
#   3D 6D 7D TD QD
# Flush with Diamonds
#   Player 2
# 4     4D 6S 9H QH QC
# Pair of Queens
# Highest card Nine
#   3D 6D 7H QD QS
# Pair of Queens
# Highest card Seven
#   Player 1
# 5     2H 2D 4C 4D 4S
# Full House
# With Three Fours
#   3C 3D 3S 9S 9D
# Full House
# with Three Threes
# # Player 1
# 
# The file, poker.txt, contains one-thousand random hands dealt to two players.
# Each line of the file contains ten cards (separated by a single space): the
# first five are Player 1's cards and the last five are Player 2's cards. You
# can assume that all hands are valid (no invalid characters or repeated
# cards), each player's hand is in no specific order, and in each hand there is
# a clear winner.
# 
# How many hands does Player 1 win?

import os, pycurl, random

class Card(object):
    """Represents a single card in a deck"""
    
    rank_strs = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
    suit_strs = ['S', 'C', 'H', 'D']
    
    value = 0   # Defaults to the Ace of Spades, 'cause Motörhead rülz!
    
    def __init__(self, arg):
        super(Card, self).__init__()
        self.value = arg
    
    def rank(self):
        """Returns the rank (e.g., A, 7, 10, Q) of this card."""
        return self.value % 13
    
    def suit(self):
        """Returns the suit (e.g., H, C) of this card."""
        return self.value // 13
    
    def __cmp__(self, other):
        return cmp(self.rank(), other.rank())
    
    def __str__(self):
        return "%2s%s" % (self.rank_strs[self.rank()], self.suit_strs[self.suit()])

def str_of_hand(cards):
    return ",".join([str(c) for c in cards])

def classify_hand(hand):
    """
    This function takes an array of 5 cards, and it determines
    what, if any, kind of poker hand it is. It returns an integer
    that can be compared with the results from other hands, and 
    some additional data about the ranks of the cards that make
    up the hand. The lists this function returns can be directly
    compared ot get the result of a call.
    
    The results returned are:
        0 - High card (rest of list is ranks of cards in hand, 
            in descending order)
        1 - Pair (rest of list is ranks of cards in hand, pair
            first, then rest in descending order)
        2 - Two pairs (rest of list is high pair, then low pair,
            then rest of list in descending order)
        3 - Three of a kind (rest of list is triplet, then rest
            of list in descending order)
    """
    
    hand.sort()
    
    result = []
    
    # Check for royal flush
    

hands_a = [[Card(random.randrange(0, 52)) for j in range(5)] for i in range(0, 10)]
hands_b = [[Card(random.randrange(0, 52)) for j in range(5)] for i in range(0, 10)]

for i in range(len(hands_a)):
    a = [Card(c) for c in hands_a[i]]
    b = [Card(c) for c in hands_b[i]]
    print "%20s |%20s" % (str_of_hand(a), str_of_hand(b))
    
    winner = compare_hands(a, b)
    if winner < 0:
        print (" " * 9) + "^"
    elif winner > 0:
        print (" " * 29) + "^"



