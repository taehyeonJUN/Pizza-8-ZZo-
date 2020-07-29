package hi.pizza.world.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import hi.pizza.world.member.MemberVo;

@Controller
public class BoardController
{
	@Resource(name="boardService")
	private BoardService BoardService;
	
	// 글목록
		
		@RequestMapping("/board/list.do")
		public String list(Map modelMap) {
			List<BoardVo> list = BoardService.selectBoardList();
			modelMap.put("boardList", list);
			return "board/boardList";
		}
		
	//??
		@RequestMapping("/board/viewer.do")
		public String viewerform(int bbsId, Map modelMap) 
		{
			BoardVo vo = BoardService.selectBoard(bbsId);
			modelMap.put("boardVo", vo);
			return "board/boardViewer";
		}
		
	// 추가 
		
		@RequestMapping(value = "/board/add.do", method = RequestMethod.GET)
		public String addform() {
			return "board/boardAdd";
		}
		
		@RequestMapping(value = "/board/add.do", method = RequestMethod.POST)
		public String add( BoardVo vo, HttpSession session) {
			MemberVo loginVo = (MemberVo)session.getAttribute("loginUser");
			vo.setBbsUser(loginVo.getMemId());
			
			int num = BoardService.insertBoard(vo);
			return "redirect:/board/list.do";
		}
		
	// 수정 {RequestMethod.GET,RequestMethod.POST}) 
		@RequestMapping(value = "/board/edit.do", method = RequestMethod.GET) // 원래GET이였음(범수)
		public String editform(int bbsId, Map modelMap) {
			BoardVo vo = BoardService.selectBoard(bbsId);
			modelMap.put("boardVo", vo);
			return "board/boardEdit";
		}
		
		@RequestMapping(value = "/board/edit.do", method = RequestMethod.POST)
		public String edit(BoardVo vo) {
			System.out.println("**************************************");
			System.out.println("**************************************");
			System.out.println("**************************************");
			int num = BoardService.updateBoard(vo);
			return "redirect:/board/list.do";
		}
		
	//삭제
		@RequestMapping("/board/del.do")
		public String del(int bbsId)
		{
			int num = BoardService.deleteBoard(bbsId);
			return "redirect:/board/list.do";
		}
}
