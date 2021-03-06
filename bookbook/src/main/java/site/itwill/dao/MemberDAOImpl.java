package site.itwill.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.itwill.dto.Member;
import site.itwill.mapper.MemberMapper;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Member> selectMemberList() {
		return sqlSession.getMapper(MemberMapper.class).selectMemberList();
	}

	@Override
	public int deleteMember(int mno) {
		return sqlSession.getMapper(MemberMapper.class).deleteMember(mno);

	}

	@Override
	public int insertMember(Member member) {
		return sqlSession.getMapper(MemberMapper.class).insertMember(member);
	}

	@Override
	public Member selectRestMember(int mno) {
		return sqlSession.getMapper(MemberMapper.class).selectRestMember(mno);
	}

	@Override
	public int updateMember(Member member) {
		return sqlSession.getMapper(MemberMapper.class).updateMember(member);
	}

	@Override
	public List<Member> selectMember(Member member) {
		return sqlSession.getMapper(MemberMapper.class).selectMember(member);
	}


}
