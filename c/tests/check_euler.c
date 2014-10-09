

#include <stdlib.h>
#include <check.h>

#include "../euler.h"

START_TEST (test_is_prime)
{
  ck_assert(is_prime(2));
  ck_assert(is_prime(3));
  ck_assert(is_prime(5));
  ck_assert(is_prime(7));
  ck_assert(is_prime(11));
  ck_assert(is_prime(13));
  ck_assert(is_prime(17));
  ck_assert(is_prime(19));
  ck_assert(is_prime(23));
  ck_assert(is_prime(29));
  ck_assert(is_prime(31));
  ck_assert(is_prime(37));
  ck_assert(is_prime(41));
  ck_assert(is_prime(43));
  ck_assert(is_prime(47));
  ck_assert(is_prime(53));
  ck_assert(is_prime(59));
  ck_assert(is_prime(61));
  ck_assert(is_prime(67));
  ck_assert(is_prime(71));
  ck_assert(is_prime(73));
  ck_assert(is_prime(79));
  ck_assert(is_prime(83));
  ck_assert(is_prime(89));
  ck_assert(is_prime(97));
  ck_assert(is_prime(101));
  ck_assert(is_prime(103));
  ck_assert(is_prime(107));
  ck_assert(is_prime(109));
  ck_assert(is_prime(113));
  ck_assert(is_prime(127));
  ck_assert(is_prime(131));
  ck_assert(is_prime(137));
  ck_assert(is_prime(139));
  ck_assert(is_prime(149));
  ck_assert(is_prime(151));
  ck_assert(is_prime(157));
  ck_assert(is_prime(163));
  ck_assert(is_prime(167));
  ck_assert(is_prime(173));
  ck_assert(is_prime(179));
  ck_assert(is_prime(181));
  ck_assert(is_prime(191));
  ck_assert(is_prime(193));
  ck_assert(is_prime(197));
  ck_assert(is_prime(199));
  ck_assert(is_prime(211));
  ck_assert(is_prime(223));
  ck_assert(is_prime(227));
  ck_assert(is_prime(229));
  ck_assert(is_prime(233));
  ck_assert(is_prime(239));
  ck_assert(is_prime(241));
  ck_assert(is_prime(251));
  ck_assert(is_prime(257));
  ck_assert(is_prime(263));
  ck_assert(is_prime(269));
  ck_assert(is_prime(271));
  ck_assert(is_prime(277));
  ck_assert(is_prime(281));
  ck_assert(is_prime(283));
  ck_assert(is_prime(293));
  ck_assert(is_prime(307));
  ck_assert(is_prime(311));
  ck_assert(is_prime(313));
  ck_assert(is_prime(317));
  ck_assert(is_prime(331));
  ck_assert(is_prime(337));
  ck_assert(is_prime(347));
  ck_assert(is_prime(349));
  ck_assert(is_prime(353));
  ck_assert(is_prime(359));
  ck_assert(is_prime(367));
  ck_assert(is_prime(373));
  ck_assert(is_prime(379));
  ck_assert(is_prime(383));
  ck_assert(is_prime(389));
  ck_assert(is_prime(397));
  ck_assert(is_prime(401));
  ck_assert(is_prime(409));
  ck_assert(is_prime(419));
  ck_assert(is_prime(421));
  ck_assert(is_prime(431));
  ck_assert(is_prime(433));
  ck_assert(is_prime(439));
  ck_assert(is_prime(443));
  ck_assert(is_prime(449));
  ck_assert(is_prime(457));
  ck_assert(is_prime(461));
  ck_assert(is_prime(463));
  ck_assert(is_prime(467));
  ck_assert(is_prime(479));
  ck_assert(is_prime(487));
  ck_assert(is_prime(491));
  ck_assert(is_prime(499));
  ck_assert(is_prime(503));
  ck_assert(is_prime(509));
  ck_assert(is_prime(521));
  ck_assert(is_prime(523));
  ck_assert(is_prime(541));
  ck_assert(is_prime(547));
  ck_assert(is_prime(557));
  ck_assert(is_prime(563));
  ck_assert(is_prime(569));
  ck_assert(is_prime(571));
  ck_assert(is_prime(577));
  ck_assert(is_prime(587));
  ck_assert(is_prime(593));
  ck_assert(is_prime(599));
  ck_assert(is_prime(601));
  ck_assert(is_prime(607));
  ck_assert(is_prime(613));
  ck_assert(is_prime(617));
  ck_assert(is_prime(619));
  ck_assert(is_prime(631));
  ck_assert(is_prime(641));
  ck_assert(is_prime(643));
  ck_assert(is_prime(647));
  ck_assert(is_prime(653));
  ck_assert(is_prime(659));
  ck_assert(is_prime(661));
  ck_assert(is_prime(673));
  ck_assert(is_prime(677));
  ck_assert(is_prime(683));
  ck_assert(is_prime(691));
  ck_assert(is_prime(701));
  ck_assert(is_prime(709));
  ck_assert(is_prime(719));
  ck_assert(is_prime(727));
  ck_assert(is_prime(733));
  ck_assert(is_prime(739));
  ck_assert(is_prime(743));
  ck_assert(is_prime(751));
  ck_assert(is_prime(757));
  ck_assert(is_prime(761));
  ck_assert(is_prime(769));
  ck_assert(is_prime(773));
  ck_assert(is_prime(787));
  ck_assert(is_prime(797));
  ck_assert(is_prime(809));
  ck_assert(is_prime(811));
  ck_assert(is_prime(821));
  ck_assert(is_prime(823));
  ck_assert(is_prime(827));
  ck_assert(is_prime(829));
  ck_assert(is_prime(839));
  ck_assert(is_prime(853));
  ck_assert(is_prime(857));
  ck_assert(is_prime(859));
  ck_assert(is_prime(863));
  ck_assert(is_prime(877));
  ck_assert(is_prime(881));
  ck_assert(is_prime(883));
  ck_assert(is_prime(887));
  ck_assert(is_prime(907));
  ck_assert(is_prime(911));
  ck_assert(is_prime(919));
  ck_assert(is_prime(929));
  ck_assert(is_prime(937));
  ck_assert(is_prime(941));
  ck_assert(is_prime(947));
  ck_assert(is_prime(953));
  ck_assert(is_prime(967));
  ck_assert(is_prime(971));
  ck_assert(is_prime(977));
  ck_assert(is_prime(983));
  ck_assert(is_prime(991));
  ck_assert(is_prime(997));
}
END_TEST

Suite * euler_suite(void) {
  Suite *s = suite_create("Euler");

  /* Core test case */
  TCase *tc_core = tcase_create("Core");
  tcase_add_test(tc_core, test_is_prime);
  suite_add_tcase(s, tc_core);

  return s;
}

int main (void) {
  int number_failed;
  Suite *s = euler_suite();
  SRunner *sr = srunner_create(s);
  srunner_run_all(sr, CK_NORMAL);
  number_failed = srunner_ntests_failed(sr);
  srunner_free(sr);
  return (number_failed == 0) ? EXIT_SUCCESS : EXIT_FAILURE;
}
