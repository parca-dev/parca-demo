<?php

declare(strict_types=1);

function Fibonacci(int $n): int {
    $a = 0;
    $b = 1;
    $tmp = 0;

    for ($i = 0; $i < $n; $i++) {
        $tmp = $a;
        $a = $b;
        $b += $tmp;
    }

    return $a;
}

while (1) {
  echo Fibonacci(42) . PHP_EOL;
}

?>
