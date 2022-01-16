package com.example.mazad.DBConnection;

import com.mysql.cj.jdbc.result.ResultSetImpl;

import java.sql.*;

public class MysqlCon {

    public static int getRowsCount(String theQuery) {
        ResultSet resultSet = null;
        Connection con = null;
        int count = 0;
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Mazad", "mazad", "mazad");
            Statement stmt = con.createStatement();
            resultSet = stmt.executeQuery(theQuery);
            if (resultSet.next())
            {
                count = resultSet.getInt(1);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public static Result getResultSetOfQuery(String query)
    {
        Result result = new Result();
        Connection con = null;
        int count = 0;
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Mazad", "root", "12345");
            Statement stmt = con.createStatement();
            ResultSet resultSet = stmt.executeQuery(query);
            result.resultSet = resultSet;
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if (con != null) try { con.close(); } catch (SQLException ignore) {}
        }
        return result;
    }
}
