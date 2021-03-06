package site.itwill.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.itwill.dto.BookIn;
import site.itwill.dto.BookInBook;
import site.itwill.dto.BookOut;
import site.itwill.dto.BookStock;
import site.itwill.mapper.BookInMapper;
@Repository
public class BookInDAOImpl implements BookInDAO{
	@Autowired
	private SqlSession sqlSession;
	/*
	@Override
	public List<BookIn> selectBookInList() {
		
		return sqlSession.getMapper(BookInMapper.class).selectBookInList();
	}
	*/
	@Override
	public List<BookInBook> selectBookInList() {
		
		return sqlSession.getMapper(BookInMapper.class).selectBookInList();
	}
	@Override
	public List<BookInBook> selectBookOutList() {
		
		return sqlSession.getMapper(BookInMapper.class).selectBookOutList();
	}
	@Override
	public List<BookStock> selectStockList() {
		
		return sqlSession.getMapper(BookInMapper.class).selectStockList();
	}
	@Override
	public int insertBookout(BookOut bookout) {
		
		return sqlSession.getMapper(BookInMapper.class).insertBookout(bookout);
	}
	@Override
	public int insertBookin(BookIn bookin) {
		
		return sqlSession.getMapper(BookInMapper.class).insertBookin(bookin);
	}
	@Override
	public int updateStock(BookOut bookout) {
		
		return sqlSession.getMapper(BookInMapper.class).updateStock(bookout);
	}
}
