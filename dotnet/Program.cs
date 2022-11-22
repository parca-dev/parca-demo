using System;

namespace Demo
{
  class Program
  {
    static int Fibonacci(int n)
    {
      int a = 0, b = 1, tmp;

      for (int i = 0; i < n; i++)
      {
        tmp = a;
        a = b;
        b += tmp;
      }

      return a;
    }

    static void Main(string[] args)
    {
      while (true)
      {
        Console.WriteLine(Fibonacci(42));
      }
    }
  }
}
