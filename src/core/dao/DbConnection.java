package core.dao;


import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import akro.HibernateSessionFactory;


public class DbConnection {
	
	static {
		try {
			Class.forName(HibernateSessionFactory.getConnectionDriverClass());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	public static Connection getConnection() {
		Connection con = null;
		String url = HibernateSessionFactory.getConnectionUrl();
		String userName = HibernateSessionFactory.getConnectionUserName();
		String userPwd = HibernateSessionFactory.getConnectionPassword();
		try {
			con = DriverManager.getConnection(url, userName, userPwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public static void closeConnection(ResultSet rs, Statement st, Connection conn) {
		if (rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (st!=null) {
			try {
				st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn!= null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
