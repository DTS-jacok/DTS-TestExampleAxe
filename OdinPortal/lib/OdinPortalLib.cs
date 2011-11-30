using System;
using OdinTechnology.Axe.Runtime;

namespace OdinPortal
{
    public class OdinPortalLib
    {
        public static int MyValidateLength(ITest axe, string expected, string actual)
        {
            string actualLength = actual.Length.ToString();
            int result;
            if (actualLength == expected)
                result = 0;
            else
                result = 1;

            axe.StepValidate(expected, actualLength, result);
            return result;
        }
    }
}