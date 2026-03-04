package com.project.domain;
import java.util.Date;
import lombok.Data;

@Data
public class Reply {
	private Integer replyNo;
    private Integer boardNo;
    private String replyText;
    private String replyer;
    private Integer parentNo; // 대댓글용 부모 번호
    private Date regDate;
    private Date updDate;
}
