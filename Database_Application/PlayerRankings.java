import com.ibm.db2.jcc.DB2Driver;

import java.sql.*;

public class PlayerRankings {
    public static String show() throws SQLException {
        String result = "";
        result = result.concat(String.format("%-60s %-20s %-20s %-20s\n", "PLAYER NAME", "PLAYER ID", "MATCHES", "GOALS"));

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
        Statement statement = con.createStatement ( ) ;


        String query = "WITH nonameinfo(pid, matches, goals) " +
                "AS " +
                "(WITH goalinfo(pid, matches) " +
                "AS(SELECT pid, count(DISTINCT mid) " +
                "FROM played " +
                "GROUP BY pid) " +
                "SELECT allplayers.pid, matches, goals " +
                "FROM (SELECT players.pid, matches " +
                "FROM players " +
                "LEFT OUTER JOIN goalinfo ON goalinfo.pid = players.pid) " +
                "AS allplayers " +
                "LEFT OUTER JOIN (SELECT pid, COUNT(*) " +
                "AS goals FROM pscore GROUP BY pid) " +
                "AS goalinfo " +
                "ON allplayers.pid = goalinfo.pid) " +
                "SELECT name, pid AS PlayerID, matches AS MatchesPlayed, goals AS GoalsScored " +
                "FROM nonameinfo LEFT OUTER JOIN people ON nonameinfo.pid = people.id " +
                "ORDER BY goals desc NULLS LAST , matches desc";

        try {
            ResultSet rankings = statement.executeQuery(query);

            String name;
            int id;
            int matches;
            int goals;
            while (rankings.next()) {
                name = rankings.getString("NAME");
                id = rankings.getInt("PLAYERID");
                matches = rankings.getInt("MATCHESPLAYED");
                goals = rankings.getInt("GOALSSCORED");

                result = result.concat(String.format("%-60s %-20s %-20s %-20s\n", name, id, matches, goals));


            }
        } catch (SQLException e) {
            System.err.println("msg: " + e.getMessage() +
                    "code: " + e.getErrorCode() +
                    "state: " + e.getSQLState());
        }

        return result;

    }
}
