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
@Alias("ReviewDto")
public class ReviewDto {
	private int reviewnum;
	private String movietitle;
	private int raiting;
	private String email;
	private Timestamp writeday;
	private String content;
}
