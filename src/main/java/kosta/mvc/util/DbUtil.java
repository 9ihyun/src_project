package kosta.mvc.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DbUtil {

	private static Properties proFile = new Properties();

	public static Properties getProFile() {
		return proFile;
	}
	//로드
	static {
		try {
			// 외부 ~.properties 파일 로딩
			proFile.load(new FileInputStream("src/main/java/kosta/mvc/util/DBProperties.properties"));
			Class.forName(proFile.getProperty("driverName"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//연결 
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(proFile.getProperty("url"), proFile.getProperty("userName"),
				proFile.getProperty("userPass"));

	}
	
	public static void dbClose(ResultSet rs, Statement st ,Connection con) {
		try {
			if (rs != null)
				rs.close();
			dbClose(st, con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
     * 닫기(DML, DDL인 경우)
     * @throws SQLException 
     */
	public static void dbClose(Statement st, Connection con) {
		try {
			if (st != null)
				st.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
