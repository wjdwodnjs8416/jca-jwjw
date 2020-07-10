package www.jca.com.vo;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.json.JSONObject;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
public class Board extends Paging{
	int id;
	String title;
	String content;
	Date wdate;
	Date udate;
	int writer;
	int boardType;
	String writerName;
	int fileCnt;
	int pictureCnt;
	int viewCount;
	int replyCnt;
	String boardName;
	String language;
	String thumbnail;
	String refLink;
	
	public static final int TYPE_ALL = 0;
	public static final int TYPE_CLASS = 6;
	public static final int TYPE_FILES = 7;
	public static final int TYPE_VIDEO = 8;
	public static final int TYPE_NOTICE = 9;
	public static final int TYPE_NOTE = 10;
	public static final int TYPE_PROJECT = 11;
	public static final int TYPE_NEWS = 12;
	public static final int TYPE_BOOK = 13;
	
	public static final int PAGE_SIZE_NORMAL = 10;
	public static final int PAGE_SIZE_CARD = 9;
	
	public static Board newInstance(int id, int boardType) {
		Board board = new Board();
		board.setId(id);
		board.setBoardType(boardType);
		return board;
	}
	public static Board newInstance(int id) {
		Board board = new Board();
		board.setId(id);
		return board;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
	public static Board parseBoard(JSONObject input) {
		Board board = new Board();
		board.setId(input.getInt("id"));
		board.setTitle(input.getString("title"));
		board.setContent(input.getString("content"));
		board.setWdate(new Date(input.getLong("wdate")));
		board.setFileCnt(input.getInt("fileCnt"));
		board.setPictureCnt(input.getInt("pictureCnt"));
		board.setBoardType(input.getInt("boardType"));
		if(!input.isNull("boardName")) {
			board.setBoardName(input.getString("boardName"));
		}
		return board;
	}
}
