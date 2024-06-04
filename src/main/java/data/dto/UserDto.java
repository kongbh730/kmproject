package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
@Alias("UserDto")
public class UserDto {
	private int usernum;
	private String email;
	private String passwd;
	private String profile;
	private String birthday;
	private boolean gender;
}
