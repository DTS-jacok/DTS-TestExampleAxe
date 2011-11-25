using System;
using System.Data;

namespace HarnessDemo
{
	public class Math
	{
		public static int AddInt(int number1, int number2)
		{
            int result = 0;
            result = number1 + number2;
            return result;
		}
	}

    public class String
    {
        public string Repeat(string input, int count)
        {
            string output = "";

            if (input == "")
            {
                throw new ArgumentException();
            }

            for (int c = 0; c < count; ++c)
            {
                output = output + input;
            }

            return output;
        }
    }
}
