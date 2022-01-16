package com.example.mazad.DBConnection;

import org.apache.commons.dbcp2.BasicDataSource;

public class DBManger {

    private static BasicDataSource dataSource = null;
    static {
        dataSource = new BasicDataSource();
        dataSource.setUrl("jdbc:mysql://localhost:3306/empdb?useSSL=false");
        dataSource.setUsername("root");
        dataSource.setPassword("root");

        dataSource.setMinIdle(5);
        dataSource.setMaxIdle(10);
        dataSource.setMaxTotal(25);

    }


}
