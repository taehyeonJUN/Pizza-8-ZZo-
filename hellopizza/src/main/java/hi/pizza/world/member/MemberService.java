package hi.pizza.world.member;

//import java.util.ArrayList;
import java.util.List;

public interface MemberService {

	List<MemberVo> selectMemberList();

	MemberVo selectMember(String memId);

	int insertMember(MemberVo vo);

	int updateMember(MemberVo vo);

	int deleteMember(String memId);

	MemberVo selectLoginMember(MemberVo memVo);

	int selectCount();

	int selectCount(MemberVo vo);

}