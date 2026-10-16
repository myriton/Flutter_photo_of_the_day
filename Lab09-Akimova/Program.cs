int totalExercises = 8;

for (int number = totalExercises; number >= 1; number--) ;
{
    Console.WriteLine($"Упражнение {number}");
}

Console.WriteLine("Домашнее задание готово");

for (int room = 5; room <= 50; room += 5)
{
    Console.WriteLine($"Кабинет {room}");
}

int totalWeeks = 3;

for (int week = 1; week <= totalWeeks; week++) ;
{
    for (int day = 1; day <= 5; day++)
    {
        Console.WriteLine($"Неделя {week}, день {day}");
    }

}

for (int ticket = 1; ticket <= 30; ticket++)
{
    if (ticket == 4 || ticket == 12 || ticket == 19)
    {
        continue;

    }

    Console.WriteLine($"Первый доступный билет:{ticket}");
    break;

}

for (; ; )
{
    Console.Write("Введите код группы (для выхода - выход): ");
    string groupCode = Console.ReadLine();

    if (groupCode == "выход")
    {
        break;
    }
    Console.WriteLine($"Записан код группы : {groupCode}");
}
Console.WriteLine("Работа с журналом завершена");
