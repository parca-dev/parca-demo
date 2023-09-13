import time

class Fibonacci:
    _memoization = {}

    @classmethod
    def _get_from_memoization(cls, n):
        time.sleep(0.001)
        return cls._memoization.get(n)

    @classmethod
    def _set_to_memoization(cls, n, value):
        time.sleep(0.002)
        cls._memoization[n] = value

    @classmethod
    def reset(cls):
        cls._memoization = {}

    def calculate(self, n):
        memoized_value = self._get_from_memoization(n)
        if memoized_value is not None:
            return memoized_value

        if n <= 1:
            return n

        result = self.calculate(n-1) + self.calculate(n-2)
        self._set_to_memoization(n, result)
        return result

    @staticmethod
    def display_result(number, result):
        print(f"Fibonacci({number}) = {result}")
