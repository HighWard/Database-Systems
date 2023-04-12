import java.sql.*;
import java.util.InputMismatchException;
import java.util.Scanner;

// import static com.ibm.db2.cmx.runtime.internal.repository.metadata.loader.StatementTypes.Insert;

public class Soccer {
    public static void main ( String [ ] args ) throws SQLException
    {
        // Scanner object to get user input
        Scanner sc = new Scanner(System.in);

        int userInput = -1;

        while(userInput != 4) {


            // Display menu & get user input
            String main_menu = "Soccer Main Menu \n\t1. List information of " +
                    "matches of a country \n\t2. Insert initial player information " +
                    "for a match \n\t3. Show player rankings by goals scored \n\t4. Exit application" +
                    "\nPlease enter your option: ";
            String insert_menu1 = "To cancel request, press [P] on the next line" +
                    "\nEnter match identifier:";


            System.out.print(main_menu);

            try{
                userInput = sc.nextInt();
            } catch (InputMismatchException e) {
                System.err.println("msg: invalid input");
                break;
            }



            while(userInput < 1 || userInput > 4){
                System.out.print("Invalid selection\nPlease enter a number between 1 and 4: ");
                try{
                    userInput = sc.nextInt();
                } catch (InputMismatchException e) {
                    System.err.println("msg: invalid input");
                    break;
                }
            }

            switch (userInput){
                case 1:
                    System.out.print("Enter a country: ");
                    sc.nextLine();
                    String country = sc.nextLine();
                    System.out.println(MatchInfo.show(country));
                    System.out.print("Press ENTER to return to the previous menu ");
                    try
                    {
                        System.in.read();
                    }
                    catch(Exception e)
                    {}

                    break;
                case 2:
                    System.out.println(Insert.listMatches());
                    System.out.println("To cancel request, press [P] on the next line" +
                            "\nEnter match identifier : ");
                    sc.nextLine();
                    String matchid = sc.nextLine();
                    if (matchid.equals("P") || matchid.equals("p")){
                        break;
                    }

                    System.out.println("Enter country : ");
                    String chosenCountry = sc.nextLine();
                    String shirtno = "";

                    while (!matchid.equals("P") && !matchid.equals("p")){
                        System.out.println(Insert.showPlayers(matchid, chosenCountry));
                        System.out.println("Press [P] to go back to previous menu");
                        System.out.println("Enter the shirt number of the player you want to insert : ");
                        shirtno = sc.next();
                        if (shirtno.equals("P") || shirtno.equals("p")){
                            break;
                        }
                        System.out.println("Select the player position : \n" +
                                "[1] Goalkeeper\n" +
                                "[2] Right Back\n" +
                                "[3] Left Back\n" +
                                "[4] Sweeper\n" +
                                "[5] Central Back\n" +
                                "[6] Defensive Midfielder\n" +
                                "[7] Winger\n" +
                                "[8] Central Midfielder\n" +
                                "[9] Striker\n");
                        String position = sc.next();
                        System.out.println(Insert.insertPlayers(shirtno, position, matchid, chosenCountry));
                    }
                    break;
                case 3:
                    String rankingsList = PlayerRankings.show();
                    System.out.println(rankingsList);

                    System.out.print("Press ENTER to return to the previous menu ");
                    try
                    {
                        System.in.read();
                    }
                    catch(Exception e)
                    {}
            }


        }
    }
}

