package hi.pizza.world.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDao {
	
	List<BoardVo> selectBoardList();

	int insertBoard(BoardVo vo);

	BoardVo selectBoard(int bbsId);

	int updateBoard(BoardVo vo);

	int deleteBoard(int bbsId);

}