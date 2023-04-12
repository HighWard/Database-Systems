import com.ibm.db2.jcc.DB2Driver;
// import com.sun.jdi.IntegerValue;

import java.sql.* ;
public class Insert {
    public static String listMatches() throws SQLException{

        int sqlCode=0;      // Variable to hold SQLCODE
        String sqlState="00000";  // Variable to hold SQLSTATE

        String result = "";

        try { DriverManager.registerDriver ( new DB2Driver() ) ; }
        catch (Exception cnfe){ System.out.println("Class not found");
        }

        String url = "jdbc:db2://winter2023-comp421.cs.mcgill.ca:50000/cs421";

        String your_userid = "";
        String your_password = "";

        if(your_userid == null && (your_userid = System.getenv("SOCSUSER")) == null)
        {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        if(your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null)
        {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }

        Connection con = DriverManager.getConnection (url,your_userid,your_password) ;
        Statement statement = con.createStatement ( ) ;

        try
        {
            String matchesStatement =
                    "SELECT m.mid, t1.country AS country1, t2.country AS country2, m.date, m.roundno " +
                            "FROM MATCH m " +
                            "INNER JOIN INVOLVES i ON m.mid = i.mid " +
                            "INNER JOIN TEAMS t1 ON i.nassociation1 = t1.nassociation " +
                            "INNER JOIN TEAMS t2 ON i.nassociation2 = t2.nassociation " +
                            "WHERE m.date BETWEEN CURRENT_DATE AND CURRENT_DATE + 3  " +
                            "AND (m.date > CURRENT_DATE OR (m.date = CURRENT_DATE AND m.time >= CURRENT_TIME)) " +
                            "AND (m.date < CURRENT_DATE + 3 OR (m.date = CURRENT_DATE + 3 AND m.time <= CURRENT_TIME))" +
                            "ORDER BY m.date, m.time ";

            //    System.out.println (matchesStatement ) ;
            java.sql.ResultSet rs = statement.executeQuery ( matchesStatement ) ;

            while ( rs.next ( ) )
            {
                int mid = rs.getInt ( "mid" ) ;
                String t1 = rs.getString ("country1");
                String t2 = rs.getString ("country2");
                String date = rs.getString ( "date");
                String roundno = rs.getString ( "roundno");

                result = result.concat(String.format("%-20s %-20s %-20s %-20s %-20s\n", mid, t1, t2, date, roundno));
            }
        }
        catch (SQLException e)
        {
            sqlCode = e.getErrorCode(); // Get SQLCODE
            sqlState = e.getSQLState(); // Get SQLSTATE
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
        }

        statement.close ( ) ;
        con.close ( ) ;

        return result;
    }


    public static String showPlayers(String matchID, String country) throws SQLException{
        int sqlCode=0;      // Variable to hold SQLCODE
        String sqlState="00000";  // Variable to hold SQLSTATE

        String result = "";


        try { DriverManager.registerDriver ( new DB2Driver() ) ; }
        catch (Exception cnfe){ System.out.println("Class not found");
        }

        String url = "jdbc:db2://winter2023-comp421.cs.mcgill.ca:50000/cs421";
        String your_userid = "";
        String your_password = "";

        if(your_userid == null && (your_userid = System.getenv("SOCSUSER")) == null)
        {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        if(your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null)
        {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }

        Connection con = DriverManager.getConnection (url,your_userid,your_password) ;
        Statement statement1 = con.createStatement ( ) ;
        Statement statement2 = con.createStatement ( ) ;

        String selected = "";
        String info1 = "The following players from " + country + " are entered in match id " + matchID + "\n";
        String header1 = (String.format("%-20s %-20s %-20s %-20s %-20s %-20s %-20s\n",
                "name", "shirtno", "position", "minentered",  "minleft", "yellowcards",  "redcard"));

        String info2 = "Possible players not selected yet: \n";
        String notSelected = "";
        String header2 = (String.format("%-20s %-20s %-20s\n",
                "name", "shirtno", "position"));

        try
        {  // name, shirtno, position, minenetered, minleft, yellowcard, redcard
            String selectedStatement =

                    "SELECT DISTINCT p.name, pl.shirtno, pl.position, pld.minentered, pld.minleft, " +
                            " pld.yellowcards, pld.redcard, i.mid, t.country, pl.pid " +
                            "FROM PEOPLE p " +
                            "JOIN PLAYERS pl ON pl.pid = p.id " +
                            "JOIN PLAYED pld ON pld.pid = p.id AND pld.pid = pl.pid " +
                            "JOIN TEAMS t ON t.nassociation = pl.nassociation " +
                            "JOIN INVOLVES i ON i.mid = pld.mid AND (i.nassociation1 = t.nassociation OR i.nassociation2 = t.nassociation) " +
                            "WHERE pld.mid = '" + matchID + "' AND t.country = '" + country  + "' " +
                            "ORDER BY pl.shirtno ";

            String notSelectedStatement =
                    "SELECT DISTINCT p.name, pl.shirtno, pl.position, pl.pid " +
                            "FROM PEOPLE p " +
                            "JOIN PLAYERS pl ON pl.pid = p.id " +
                            "JOIN TEAMS t ON t.nassociation = pl.nassociation " +
                            "WHERE t.country = '" + country + "' " +
                            "EXCEPT " +
                            "SELECT DISTINCT p.name, pl.shirtno, pl.position, pl.pid " +
                            "FROM PEOPLE p " +
                            "JOIN PLAYERS pl ON pl.pid = p.id " +
                            "JOIN PLAYED pld ON pld.pid = p.id AND pld.pid = pl.pid " +
                            "JOIN TEAMS t ON t.nassociation = pl.nassociation " +
                            "JOIN INVOLVES i ON i.mid = pld.mid AND (i.nassociation1 = t.nassociation OR i.nassociation2 = t.nassociation) " +
                            "WHERE pld.mid = '" + matchID + "' AND t.country = '" + country  + "' ";

            java.sql.ResultSet rs1 = statement1.executeQuery ( selectedStatement ) ;
            java.sql.ResultSet rs2 = statement2.executeQuery ( notSelectedStatement );

            while ( rs1.next ( ) )
            {
                try {

                    String name = rs1.getString("name");
                    Integer shirtno = rs1.getInt("shirtno");
                    String position = rs1.getString("position");
                    Integer minentered = rs1.getInt("minentered");
                    Integer minleft = rs1.getInt("minleft");
                    Integer yellowcards = rs1.getInt("yellowcards");
                    Integer redcard = rs1.getInt("redcard");
                    Integer pid = rs1.getInt("pid");

                    selected.concat(header1);

                    selected = selected.concat(String.format("%-20s %-20s %-20s %-20s %-20s %-20s %-20s \n",
                            name, shirtno, position, minentered, minleft, yellowcards, redcard));
                }
                catch (NumberFormatException nfe) {
                }
            }

            while ( rs2.next() ){
                try{
                    String name = rs2.getString("name");
                    Integer shirtno = rs2.getInt("shirtno");
                    String position = rs2.getString("position");
                    Integer pid = rs2.getInt("pid");

                    notSelected = notSelected.concat(String.format("%-20s %-20s %-20s\n",
                            name, shirtno, position));

                }
                catch (NumberFormatException nfe) {
                }
            }
        }
        catch (SQLException e)
        {
            sqlCode = e.getErrorCode(); // Get SQLCODE
            sqlState = e.getSQLState(); // Get SQLSTATE
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
        }

        result = result.concat(info1);
        result = result.concat(header1);
        result = result.concat(selected + "\n");
        result = result.concat(info2);
        result = result.concat(header2);
        result = result.concat(notSelected);

        statement1.close ( ) ;
        statement2.close ( ) ;
        con.close ( ) ;
        //    con.close ( ) ;
        return result;
    }

    public static String insertPlayers(String shirtno, String position, String matchID, String country) throws SQLException {
        int sqlCode=0;      // Variable to hold SQLCODE
        String sqlState="00000";  // Variable to hold SQLSTATE

        String result = "";

        try { DriverManager.registerDriver ( new DB2Driver() ) ; }
        catch (Exception cnfe){ System.out.println("Class not found");
        }

        String url = "jdbc:db2://winter2023-comp421.cs.mcgill.ca:50000/cs421";
        String your_userid = "";
        String your_password = "";

        if(your_userid == null && (your_userid = System.getenv("SOCSUSER")) == null)
        {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        if(your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null)
        {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }

        Connection con = DriverManager.getConnection (url,your_userid,your_password) ;
        Statement statement1 = con.createStatement ( ) ;
        Statement statement2 = con.createStatement ( ) ;

        Statement statement3 = con.createStatement ( ) ;

        try {
            //      System.out.println("trying to get rownumber");
            String numRows =
                    "SELECT COUNT(*) " +
                            "FROM PEOPLE p " +
                            "JOIN PLAYERS pl ON pl.pid = p.id " +
                            "JOIN PLAYED pld ON pld.pid = p.id AND pld.pid = pl.pid " +
                            "JOIN TEAMS t ON t.nassociation = pl.nassociation " +
                            "JOIN INVOLVES i ON i.mid = pld.mid AND (i.nassociation1 = t.nassociation OR i.nassociation2 = t.nassociation) " +
                            "WHERE pld.mid = '" + matchID + "' AND t.country = '" + country  + "' ";

            java.sql.ResultSet rs11 = statement1.executeQuery(numRows);
            while (rs11.next()) {
                try {
                    Integer count = rs11.getInt(1);
                    if (!(count <11)){
                        System.out.println("We have 11 players actively playing");
                        return result;
                    }
                    //           System.out.println("The number of active players are " + (count + 1));

                }
                catch (NumberFormatException nfe) {
                    System.out.println("some error");
                }
            }

            String name = "";
            Integer shirtNumber = null;
            String field = "";
            Integer pid = null;
            String defaultPosition = "";


            String selectedPlayer =
                    "SELECT DISTINCT p.name, pl.shirtno, pl.pid, pl.position " +
                            "FROM PEOPLE p " +
                            "JOIN PLAYERS pl ON pl.pid = p.id " +
                            "JOIN TEAMS t ON t.nassociation = pl.nassociation " +
                            "WHERE pl.shirtno = '" + shirtno + "' AND t.country = '" + country + "' " +
                            "EXCEPT " +
                            "SELECT DISTINCT p.name, pl.shirtno, pl.pid, pl.position " +
                            "FROM PEOPLE p " +
                            "JOIN PLAYERS pl ON pl.pid = p.id " +
                            "JOIN PLAYED pld ON pld.pid = p.id AND pld.pid = pl.pid " +
                            "JOIN TEAMS t ON t.nassociation = pl.nassociation " +
                            "JOIN INVOLVES i ON i.mid = pld.mid AND (i.nassociation1 = t.nassociation OR i.nassociation2 = t.nassociation) " +
                            "WHERE pld.mid = '" + matchID + "' AND t.country = '" + country  + "' ";


            java.sql.ResultSet rs1 = statement1.executeQuery(selectedPlayer);

            while (rs1.next()) {
                try {
                    name = rs1.getString("name");
                    shirtNumber = rs1.getInt("shirtno");
                    defaultPosition = rs1.getString("position");
                    pid = rs1.getInt("pid");

                    switch (Integer.valueOf(position)){
                        case 1:
                            field = "Goalkeeper";
                            break;
                        case 2:
                            field = "Right back";
                            break;
                        case 3:
                            field = "Left back";
                            break;
                        case 4:
                            field = "Sweeper";
                            break;
                        case 5:
                            field = "Central Back";
                            break;
                        case 6:
                            field = "Defensive Midfielder";
                            break;
                        case 7:
                            field = "Winger";
                            break;
                        case 8:
                            field = "Central Midfielder";
                            break;
                        case 9:
                            field = "Striker";
                            break;
                        default:   //THIS DOESN'T WORK FOR SOME REASON
                            field = defaultPosition;
                            break;
                    }

                    result = result.concat(String.format("%-20s %-20s %-20s\n",
                            name, shirtno, field));

                    String insertSQL = "INSERT INTO PLAYED " +
                            "VALUES ('" + pid + "','" + matchID + "', 0, NULL, 0, 0, '" + field + "' )";
                    statement2.executeUpdate( insertSQL);

                    String updateSQL = "UPDATE PLAYERS" + " SET position = '" + field + "' WHERE pid = '"  + pid + "' ";
                    statement3.executeUpdate(updateSQL);
                    System.out.println("\nAdding player");

                }
                catch (NumberFormatException nfe) {
                }
            }
        }
        catch (SQLException e)
        {
            sqlCode = e.getErrorCode(); // Get SQLCODE
            sqlState = e.getSQLState(); // Get SQLSTATE
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
        }

        statement1.close ( ) ;
        statement2.close ( ) ;
        statement3.close ( ) ;
        con.close ( ) ;

        return result;
    }
}
