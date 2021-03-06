package site.itwill.mapper;

import java.util.List;

import site.itwill.dto.Notice;

public interface NoticeMapper {
	int insertNotice(Notice notice);
	int updateNotice(Notice notice);
	int countUp(int nno);
	int deleteNotice(int nno);
	Notice selectNotice(int nno);
	List<Notice> selectNoticeList();
}
