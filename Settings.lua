using System;

class Program
{
    static void Main()
    {

        Console.WriteLine("Please enter the max Pollution"); // רמת הזיהום המותרת
        int MaxPollution = int.Parse(Console.ReadLine())"

        int Days = 30; // מספר הימים
        int Sum = 0;
        int maxDay = 1;

        for (int day = 1; day <= Days; day++)
        {
            Console.WriteLine("Pollution1 for day:  " + day + ": "); // זיהום ראשון ליום זה
            int Pollution1 = int.Parse(Console.ReadLine());



            Sum += Pollution; // מוסיפים את הכמות לסה"כ

            if (Pollution > MaxPollution)
            {
                maxPollution = pollution;
                maxDay = day;
            }
        }

        if (days > 0)
        {
            double average = (double)sum / days;
            Console.WriteLine("רמת הזיהום הממוצעת היא: " + average);
            Console.WriteLine("היום עם רמת הזיהום הגבוהה ביותר הוא יום מספר: " + maxDay);
        }
        else
        {
            Console.WriteLine("לא הוזנו נתונים.");
        }
    }
}