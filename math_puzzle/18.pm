# # ケーキをN個に切り分けるとき、1 ~ N の配列になる。
# # n = 5 => array = [1,2,3,4,5];
# # n = 9 => array = [1,2,3,4,5,6,7,8,9];
# # 配列の順番を入れ替えて、隣り合う2つの和が、全て平方数になればOK.
# # 平方数とは: 自然数を二乗したときの数。1,4,9,16...。
# #
# # Hint: 隣り合う2つの数値の和は、最大でも、2n - 1 個。
# use strict;
# use warnings;
# use POSIX qw(floor);
#
# sub calc {
#     my $n = shift;
#     my $list = [$n, 1 .. $n];
#
#     my $num = floor sqrt(2 * $n - 1);
#     my $square_numbers = [map { $_ * $_ }  (1 .. $num)];
#
#     return search([@$list], $square_numbers);
# }
#
# sub search {
#     my ($list, $square_numbers) = @_;
#     print "24: search " . join(",", @$list) . "\n";
#     return 1 unless @$list;
#
#     my $last = $list->[-1];
#     my $enable_squares = [grep { $_ > $last } @$square_numbers];
#     print "29: $last enable use ". join(",", @$enable_squares) . "\n";
#     return 0 unless @$enable_squares;
#
#     for my $sq (@$enable_squares) {
#         print "33: check $sq\n";
#         my $couple = $sq - $last;
#         return 0 if $couple == $last;
#         delete @$list[-1];
#         $list = [grep { $_ ne $couple } @$list];
#         print "35: rest list are " . join(",", @$list) . "\n";
#         return 1 if search($list, $square_numbers);
#     }
#     return 0;
# }
#
# for my $n (1..20) {
#     print "start $n\n";
#     if (calc($n)) {
#         last;
#     }
# }
