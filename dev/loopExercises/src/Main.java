//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    private int noRows = 5;  //number of rows for all exercises in Exercise 1
    public static void main(String[] args) {
        Main menu = new Main();
       // menu.exer_1_1();
       // menu.exer_1_2();
        //menu.exer_1_3();
        //menu.exer_1_4();
        //menu.exer_1_5();
        menu.exer_1_6();
    }


public void exer_1_1(){
    for (int i = 1; i < noRows; i++) {
        for (int j = 1; j <= 10; j++)
        {
            System.out.print('*');
        }
        System.out.println();  // go to next line
    }

}
    public void exer_1_2(){
        for (int i = 1; i <= noRows; i++) {
            for (int j = 1; j <= i; j++)
            {
                System.out.print('*');
            }

            System.out.println();  // go to next line
        }

    }
    public void exer_1_3() {
        for (int i = 1; i <= noRows; i++) {
            for (int j = 1; j <= (noRows-i); j++) {
                System.out.print(' ');
            }
            for (int j = (noRows-i+1); j <= noRows; j++) {
                System.out.print('*');
            }
            System.out.println();  // go to next line
        }
    }

    public void exer_1_4() {
        for (int i = 1; i <= noRows; i++) {
            for (int j = 1; j <= (noRows-i); j++) {
                System.out.print(' ');
            }
            for (int j = 1; j < i*2; j+=1) {
                System.out.print('*');
            }
            System.out.println();  // go to next line
        }
    }
    public void exer_1_5() {
        for (int i = 1; i <= noRows; i++) {
            for (int j = 1; j <= (noRows-i); j++) {
                System.out.print(' ');
            }
            for (int j = 1; j < i*2; j+=1) {
                System.out.print(i);
            }
            System.out.println();  // go to next line
        }
    }

    public void exer_1_6() {
        for (int i = 1; i <= noRows; i++) {
            for (int j = 1; j <= (noRows-i); j++) {
                System.out.print(' ');
            }
            for (int j = 1; j <= i; j+=1) {
                for (int k = i; k >= 1; k--)
                    System.out.print(k);
                for (int k = 2; k <= i; k++)
                    System.out.print(k);

            }
            System.out.println();  // go to next line
        }
    }
    }