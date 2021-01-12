/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SpyECho
 */
public class Cnx {
    public static Connection get() 
    {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            Connection c= DriverManager.getConnection("jdbc:oracle:thin:@SpyECho:1521:orcl", "scott", "ntic");
        return c;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Cnx.class.getName()).log(Level.SEVERE, null, ex);
        return null;
        }
        
    }
}
