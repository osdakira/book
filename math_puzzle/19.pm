# 1 .. N までの合成数から、7個の数を選んだ時、最大で6段階たどることになる最小のNを求める。
# Hint
#   1      2     3       4      5     6      7
# a * a, a * b, b * c, c * d, d * e, e * f, f * f

# 6個の素数がある最小のNを求める？

my @primes = ();

sub is_prime_number {
    my $x = shift;
    my $sq = sqrt($x);
    my @compares = grep { $_ <= $sq } @primes;
    return 1 unless @compares;
    return scalar(grep { $x % $_ == 0 } @compares) == 1;
}

{
    my $n = 1;
    while (1) {
        print "\$n = $n, primes: " . join(",", @primes) . "\n";
        push @primes, $n if is_prime_number($n);
        last if (scalar(@primes) >= 7);
        $n += 1;
        last if $n > 10000;
    }
    print "\$n = $n, primes: " . join(",", @primes) . "\n";
}
