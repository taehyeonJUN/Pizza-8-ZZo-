package hi.pizza.world.board;

import java.util.List;

public interface BoardService {
	
	List<BoardVo> selectBoardList();

	int insertBoard(BoardVo vo);

	BoardVo selectBoard(int bbsId);

	int updateBoard(BoardVo vo);

	int deleteBoard(int bbsId);

}