package hi.pizza.world.member;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

//싱글톤(Singleton) 패턴 :
// 애플리케이션 전체에서 객체(인스턴스)를 "1개만" 만들어서 여러곳에서 함께 사용

// 이 객체를 서비스역할을 하는 객체로서  MemberService 라는 이름으로 스프링에 등록
@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Resource(name = "memberDao")
	private MemberDao memberDao;
	
	@Override
	public List<MemberVo> selectMemberList() {
		return memberDao.selectMemberList();
	}

	@Override
	public MemberVo selectMember(String memId) {
		return memberDao.selectMember(memId);
	}

	@Override
	public int insertMember(MemberVo vo) {
		System.out.println("##################");
		return memberDao.insertMember(vo);
	}

	@Override
	public int updateMember(MemberVo vo) {
		return memberDao.updateMember(vo);
	}

	@Override
	public int deleteMember(String memId) {
		return memberDao.deleteMember(memId);
	}

	@Override
	public MemberVo selectLoginMember(MemberVo memberVo) {
		return memberDao.selectLoginMember(memberVo);
	}

	@Override
	public int selectCount(MemberVo vo) {
		return memberDao.selectCount(vo);
	}

	@Override
	public int selectCount() {
		return 0;
	}
	
}
