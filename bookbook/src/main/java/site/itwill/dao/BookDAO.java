package site.itwill.dao;

import java.util.List;
import java.util.Map;

import site.itwill.dto.Book;

public interface BookDAO {
	public List<Book> selectAllBookList();
	public int updateBookLoc(Map<String, String> map);
	public Book selectBook(String bookCode);
	public int insertBook(Book book);
	public  List<Book> selectBookList();
	public List<Book> selectDynamicBookList(Book book);
	public int deleteBook(int num);
}
