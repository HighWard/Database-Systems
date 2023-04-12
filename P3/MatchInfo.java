import com.ibm.db2.jcc.DB2Driver;

import java.sql.*;
import java.util.Optional;

public class MatchInfo {

    public static String show(String country) throws SQLException{

        String result = "";
        result = result.concat(String.format("%-20s %-20s %-20s %-40s %-20s %-20s %-20s\n", "COUNTRY1", "COUNTRY2", "DATE", "ROUND", "SCORE COUNTRY1", "SCORE COUNTRY2", "TICKETS SOLD"));

        // Register the driver.  You must register the driver before you can use it.
        try { DriverManager.registerDriver ( new DB2Driver() ) ; }
        catch (Exception cnfe){ System.out.println("Class not found"); }

        // This is the url you must use for DB2.
        //Note: This url may not valid now ! Check for the correct year and semester and server name.
        String url = "jdbc:db2://winter2023-comp421.cs.mcgill.ca:50000/cs421";

        //REMEMBER to remove your user id and password before submitting your code!!
        String your_userid = "";
        String your_password = "";
        //AS AN ALTERNATIVE, you can just set your password in the shell environment in the Unix (as shown below) and read it from there.
        //$  export SOCSPASSWD=yoursocspasswd
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

        // mid, nassociation, score
        String scoresStatement = "SELECT mid, nassociation, count(*) as score " +
                "FROM tscore " +
                "GROUP BY mid, nassociation";


        // Matches country1, country2, nass1, nass2, mid
        String matchesStatement = "WITH partinfo(country1, nassociation1, nassociation2, mid) AS " +
                "(SELECT country, nassociation1, nassociation2, mid " +
                "FROM involves JOIN teams ON involves.nassociation1 = teams.nassociation) " +
                "SELECT country1, country AS country2, nassociation1, nassociation2, mid " +
                "FROM partinfo JOIN teams " +
                "ON partinfo.nassociation2 = teams.nassociation";

        // mid, date, roundno, tickets
        String soldStatement = "SELECT DISTINCT match.mid, date, roundno, count(*) as tickets " +
                "FROM match LEFT OUTER JOIN payforticket " +
                "ON match.mid = payforticket.mid " +
                "GROUP BY match.mid, date, roundno";




        try {
            ResultSet matches = statement1.executeQuery(matchesStatement);
        while(matches.next()){
            String country1 = matches.getString("country1");
            String country2 = matches.getString("country2");
            if(! country1.equals(country) && ! country2.equals(country)){
                continue;
            }
            String nass1 = matches.getString("nassociation1");
            String nass2 = matches.getString("nassociation2");
            int mid = matches.getInt("mid");

            int score1 = 0;
            int score2 = 0;


            ResultSet scores = statement2.executeQuery(scoresStatement);
            while(scores.next()){
                if (scores.getInt("mid") == mid && scores.getString("nassociation").equals(nass1)){

                    score1 = score1 + scores.getInt("score");
                }
                else if(scores.getInt("mid") == mid &&
                        scores.getString("nassociation").equals(nass2)){
                    score2 = score2 + scores.getInt("score");
                }
            }

            int ticketsSold = 0;
            Optional<String> roundOp = Optional.empty();
            Optional<Date> dateOp = Optional.empty();

            ResultSet sold = statement3.executeQuery(soldStatement);
            while(sold.next()){
                if (sold.getInt("mid") == mid){
                    ticketsSold = sold.getInt("tickets");
                    roundOp = Optional.ofNullable(sold.getString("roundno"));
                    dateOp = Optional.ofNullable(sold.getDate("date"));
                    break;
                }
            }

            String round = "NULL";
            String date = "NULL";
            if(roundOp.isPresent()){
                round = roundOp.get();
            }
            if(dateOp.isPresent()){
                date = String.valueOf(dateOp.get());
            }

            result = result.concat(String.format("%-20s %-20s %-20s %-40s %-20s %-20s %-20s\n", country1, country2, date, round, score1, score2, ticketsSold));

        }
        } catch (SQLException e) {
            System.err.println("msg: " + e.getMessage() +
                    "code: " + e.getErrorCode() +
                    "state: " + e.getSQLState());
        }


        // Finally but importantly close the statement and connection
        statement1.close ( ) ;
        statement2.close ( ) ;
        statement3.close ( ) ;

        con.close ( ) ;
        return result;

    }
}