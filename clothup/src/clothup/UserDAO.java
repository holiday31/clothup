package clothup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import clothup.DB;

public class UserDAO {

	public static void create(User user) throws Exception {
		String sql = "insert into user values (null, ? , ? , ? , ? ) ";
		try (Connection connection = DB.getConnection("clothup");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, user.getUserId());
			statement.setString(2, user.getPassword());
			statement.setString(3, user.getName());
			statement.setString(4, user.getEmail());
			statement.executeUpdate();
		}
	}
	
	
	public static boolean idCheck(String id) throws Exception {
		ResultSet rs=null;
		boolean check=false;
		String sql = "select * from clothup.user where userId=?";
		try (Connection connection = DB.getConnection("clothup");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, id);
			rs=statement.executeQuery();
			if(rs.next()) //해당 아이디 존재
				check=true;
			return check;
		}
	}
	
	public static boolean login(String userid,String password) throws Exception {
		ResultSet rs=null;
		boolean check=false;
		String sql = "select * from user where userId=? and password=?";
		try (Connection connection = DB.getConnection("clothup");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, userid);
			statement.setString(2, password);
			rs=statement.executeQuery();
			if(rs.next()) //해당 아이디 존재
				check=true;
			return check;
		}
	}
	
	
	
	
}
