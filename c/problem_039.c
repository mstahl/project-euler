/*
 * Problem 039
 *
 * If p is the perimeter of a right angle triangle with integral length sides,
 * {a,b,c}, there are exactly three solutions for p = 120.
 *
 * {20,48,52}, {24,45,51}, {30,40,50}
 *
 * For which value of p ≤ 1000, is the number of solutions maximised?
 *
 * https://projecteuler.net/problem=39
 */

#include <euler.h>

uint64_t number_of_solutions(uint64_t perimeter) {
  uint64_t solutions_found = 0;

  for(uint64_t a = 1; a < perimeter; ++a) {
    for(uint64_t b = a; b < perimeter - a; ++b) {
      uint64_t c = perimeter - b - a;

      if(c < a || c < b) continue;
      if(a*a + b*b != c*c) continue;

      solutions_found++;
    }
  }

  return solutions_found;
}

int main(void) {
  uint64_t best_perimeter = 0;
  uint64_t best_solution_count = 0;

  for(uint64_t perimeter = 3; perimeter <= 1000; ++perimeter) {
    uint64_t solution_count = number_of_solutions(perimeter);

    if(solution_count > best_solution_count) {
      best_perimeter = perimeter;
      best_solution_count = solution_count;
    }
  }

  printf("%lu\n", best_perimeter);
}

// Answer: 840
