import java.util.Scanner;

class Car {
    public String name;
    public int speed;


    public Car(String name, int speed) {
        this.name = name;
        this.speed = speed;
    }
    public String getName() {
        return name;
    }
    public int getSpeed() {
        return speed;
    }
}

class Race {
    private String currentLeader;
    private int leaderDistance;
    private static final int time = 24;

    public Race() {
        currentLeader = "";
        leaderDistance = 0;
    }
    public void checkNewLeader(Car car) {
        int newDistance = car.getSpeed() * time;

        if (newDistance > leaderDistance) {
            currentLeader = car.getName();
            leaderDistance = newDistance;
        }
    }

    public String getCurrentLeader() {
        return currentLeader;
    }
    public int getLeaderDistance() {
        return leaderDistance;
    }
}

public class Main {
    public static void main(String[] args) {
        Race race = new Race();

        Scanner scanner = new Scanner(System.in);


        for (int i = 1; i <= 3; i++) {
            System.out.print("Введите название машины №" + i + ": ");
            String name = scanner.nextLine();

            int speed = 0;
            boolean isValid = false;
            while (!isValid) {
                try {
                    System.out.print("Введите скорость машины №" + i + " (0-250 км/ч): ");
                    speed = Integer.parseInt(scanner.nextLine());


                    if (speed >= 0 && speed <= 350) {
                        isValid = true;
                    } else {
                        System.out.println("Ошибка! Скорость должна быть в диапазоне 0-250 км/ч");
                    }
                } catch (NumberFormatException e) {

                    System.out.println("Ошибка! Введите целое число");
                }
            }

            Car car = new Car(name, speed);

            race.checkNewLeader(car);
        }

        System.out.println("Победитель гонки: " + race.getCurrentLeader());
        System.out.println("Пройденная дистанция: " + race.getLeaderDistance() + " км");
    }
}