package hi.pizza.world.pizzamenu;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("/pizzaMenu/list.do")
public class PizzaMenuController {

	@Resource(name ="pizzaMenuService")
	private PizzaMenuService pizzaMenuService;
	
	
	//사이즈 출력
	@RequestMapping(value ="/pizzaMenu/list.do")
	public String seletList(Map modelMap) {
		
		List<PizzaMenuVo> seletList = pizzaMenuService.seletList();
		modelMap.put("seletList", seletList);
		return "pizzaMenu/PizzaMenu";
	}
	
	//토핑출력
//	@RequestMapping(value ="/pizzamenu/list.do")
//	public String toppingList(Map modelMap) {
//		PizzaMenuVo toList = pizzaMenuService.selectTopping();
//		modelMap.put("toList", toList);
//		return "pizzaMenu/PizzaMenu";
//	}
//	
//	//사이드메뉴 출력
//	@RequestMapping(value ="/pizzamenu/list.do")
//	public String sideList(Map modelMap) {
//		
//		PizzaMenuVo sideLi = pizzaMenuService.selectSide();
//		modelMap.put("sideLi", sideLi);
//		return "pizzaMenu/PizzaMenu";
//	}

}
