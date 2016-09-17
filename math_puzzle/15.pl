# ある 階段 を 下 から A さん が 上がっ て いく と 同時に、 上 から B さん が 下り て き ます。 階段 は 1 段 ずつ 上がる（ 下りる） 必要 は なく、 最大 で 3 段 まで 飛ばし て 進む（ 一気に 4 段 進む） こと が でき ます。
# 「 2 人 が 同じ 段 に 止まる よう な 動き 方」 が 何 通り ある かを 考え ます。（

# 10 段 の 階段 で 同じ よう に 移動 し た とき、

# 初期値
# a = 0
# b = 10

# 1回目
# a => [1, 2, 3]
# b => [9, 8, 7]

# 1段ずつ5回目が minimum
# a => 1, 2, 3, 4, 5
# b => 9, 8, 7, 6, 5

use List::MoreUtils qw/uniq true/;
use Data::Dumper;

my $map = { 0 => [10] };
for my $count (1..10) {
    for my $a_step (1 .. 4) {
        my $a_stair = $count - 1 + $a_step;
        my $b_stairs = $map->{$count - 1};

        for my $b_step (1 .. 4) {
            for (@$b_stairs) {
                my $new_b_stair = $_ - $b_step;
                next if $a_stair > $new_b_stair;
                push @{ $map->{$a_stair} }, $new_b_stair;
            }
        }
    }
}

my $case_count = 0;
for my $a_stair (keys %$map) {
    $case_count +=  true { $_ == $a_stair } @{ $map->{$a_stair} };
}
print $case_count . "\n";
print STDERR Dumper $map;
