# 同じ 長 さの 3 本 の ひも を 折り曲げ て 3 つ の 四角形 を 作る こと を 考え ます。 その うち 2 本 で それぞれ 長方形 を 作り、 残り の 1 本 は 正方形 を 作り ます。 この とき、 作っ た 2 つ の 長方形 の 面積 の 和 が、 正方形 の 面積 と 同じ に なる こと が あり ます。
#
# ひも の 長 さを 1 から 500 まで 変化 さ せる とき、 2 つ の 長方形 の 面積 の 和 と、 正方形 の 面積 が 同じ に なる 組 が 何 通り ある かを 求め て ください。
#
#  ただし、 同じ 比 で 整数 倍 の もの は 1 つ として カウント する もの と し ます。
#
# - Q. 正方形を作るには？
# - A. 1,2,3 は NG, 4 OK. 5,6,7 NG, 8, OK. つまり紐の長さは4で割れる数だけ考えれば良い
#
# - Q. 長さの異なる長方形を作れる必要がある。
# - A. 12以上
#
# - 長方形の短辺は、ロープの長さの平方根よりも小さいはず

use strict;
use warnings;
use utf8;
use POSIX qw(floor);
use Data::Dumper;
use Math::Combinatorics;
use Test::More;

use constant MAX => 500;

###
# 写経版
###

my $answers = [];

for my $c (1 .. MAX/4) {
    my @edge = map { $_ * (2 * $c - $_) } (1 .. ($c - 1));
    for (combine(2, @edge)) {
        my ($a, $b) = @$_;
        ($a, $b) = ($b, $a) if $a > $b;
        # print join(",", ($a, $b)) . "\n";
        if ($a + $b == $c * $c) {
            push @$answers, [1, $b / $a, $c * $c / $a];
            # print join(",", (1, $b / $a, $c * $c / $a)) . "\n";
        }
    }
}

# print join(",", @$_) . "\n" for (@$answers);

# print STDERR Dumper scalar @$answers;

my $uniq_ratios = [];
for my $answer (@$answers) {
    unless (grep { Test::More::eq_array($answer, $_) } @$uniq_ratios) {
        push @$uniq_ratios, $answer;
    }
}

# for (@$uniq_ratios) {
#     print join(",", @$_) . "\n";
# }

print STDERR Dumper scalar @$uniq_ratios;

###
# @osada original code. But not correct.
###

# my $ropes = [grep { $_ % 4 == 0 } (12 .. 500)];
#
# my $ropes_counts = {};
#
# for my $rope (@$ropes) {
#     my $half_rope = $rope / 2;
#     my $square = ($half_rope / 2) ** 2;
#
#     # my $max_short_side = floor sqrt $rope;
#     my $max_short_side = $half_rope - 1;
#     for my $short_side_1 (1 .. $max_short_side) {
#         my $long_side_1 = $half_rope - $short_side_1;
#         last if $long_side_1 <= 0;
#         my $rectangle_1 = $short_side_1 * $long_side_1;
#
#         for my $short_side_2 (1 .. $max_short_side) {
#             my $long_side_2 = $half_rope - $short_side_2;
#             last if $long_side_2 <= 0;
#             my $rectangle_2 = $short_side_2 * $long_side_2;
#
#             if ($rectangle_1 + $rectangle_2 == $square) {
#                 $ropes_counts->{$rope} = [$rectangle_1, $rectangle_2, $square];
#             }
#         }
#     }
# }

# print STDERR Dumper $ropes_counts;
#
# my $ratios = [];
# for (values %$ropes_counts) {
#     my $ratio = [1, ($_->[1] / $_->[0]), ($_->[2] / $_->[0])];
#     unless (grep { Test::More::eq_array($ratio, $_) } @$ratios) {
#         push @$ratios, $ratio;
#     }
# }
#
# print STDERR Dumper @$ratios;
# print STDERR Dumper scalar @$ratios;
