package util;

import java.beans.Expression;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 
 * @author Administrator
 *
 */
public class DBHelper {
	//实现DBHelper
	private static final String driver = "com.mysql.jdbc.Driver";//数据库驱动
	//连接数据库的URL地址
	private static final String url = "jdbc:mysql://locahost:3306/shopping?useUnicode=true&characterEncoding=UTF";
	private static final String username = "root";//数据库的用户名
	private static final String password = "";//数据库的密码
	
	private static Connection conn = null;
	
	//静态代码块加载驱动
	static {
		try {
			Class.forName(driver);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	//单利模返回数据库
	public static Connection getConnection() throws SQLException {
		if(conn == null) {
			conn = DriverManager.getConnection(url,username,password);
			return conn;
		}
		return conn;
		
	}
	//主函数
	public static void main(String[] args) {
		try {
			Connection conn = DBHelper.getConnection();
			if(conn != null) {
				System.out.println("数据库连接正常！");
			} else {
				System.out.println("数据库连接异常！");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
