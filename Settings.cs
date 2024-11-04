using System;

class Program
{
    static void Main()
    {
        Console.WriteLine("Please enter the max Pollution"); // רמת הזיהום המותרת
        int MaxPollution = int.Parse(Console.ReadLine())"

        int Days = 30; // מספר הימים
        int GoodDays = 0; // ימים ללא זיהום

        for (int day = 1; day <= Days; day++)
        {
            Console.WriteLine("Pollution1 for day:  " + day + ": "); // זיהום ראשון ליום זה
            int Pollution1 = int.Parse(Console.ReadLine());

            Console.WriteLine("Pollution2 for day:  " + day + ": "); // זיהום שני ליום זה
            int Pollution2 = int.Parse(Console.ReadLine());

            if (Pollution1 > Pollution2) {
                Console.WriteLine("On day :" + day + "Pollution1 was higher");

                if (Pollution1 > MaxPollution) {
                    Console.WriteLine("Pollution1 was higher than MaxPollution");
                }
                else {
                    GoodDays++;
                }
            }
            elseif (Pollution2 > Pollution1) {
                Console.WriteLine("On day :" + day + "Pollution2 was higher");

                if (Pollution2 > MaxPollution) {
                    Console.WriteLine("Pollution2 was higher than MaxPollution");
                }
                else {
                    GoodDays++;
                }
            }
            else {
                 Console.WriteLine("On day :" + day + "Pollution2 was higher");

                if (Pollution2 > MaxPollution) {
                    Console.WriteLine("Pollution2 was higher than MaxPollution");
                }
                else {
                    GoodDays++;
                }
            }
        }
        Console.WriteLine("Number of good days: " + GoodDays);
    }
}
