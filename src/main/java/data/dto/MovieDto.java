package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
@Alias("MovieDto")
public class MovieDto {
	private int movienum;
	private String title;
	private String poster;
	private String director;
	private String actor;
	private int publishyear;
	private float totalrate;
	private String genre;
	private String youtubeURL;
}
