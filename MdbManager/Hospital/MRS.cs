using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MdbManager.Hospital
{
   public static class MRS
    {
        public static DateTime? GetDate(string dateTime)
        {
            if (!string.IsNullOrWhiteSpace(dateTime))
            {
                System.Globalization.CultureInfo culture = new System.Globalization.CultureInfo("en-GB");
                return Convert.ToDateTime(dateTime, culture);
            }
            return null;
        }
        public static string GetISTDateTimeInString()
        {
            return TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString();
        }
    }
}
