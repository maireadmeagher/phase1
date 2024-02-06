
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

    }

    public static int mystery1(int val1, int val2) {
     int val3 = 3;
     return (val1+val2+val3)^2;
    }


    public static int mystery2(int val1, int val2) {
     int val3 = 3;
     Scanner in = new Scanner(System.in);
     System.out.println("Enter a number: ");
     try {
         val3 = in.nextInt();
     } catch (Exception e) {
         e.printStackTrace();
     }
     return (val1+val2+val3)^2;

    }
}
