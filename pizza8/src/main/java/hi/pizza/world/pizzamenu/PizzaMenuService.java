package hi.pizza.world.pizzamenu;

import java.util.List;


public interface PizzaMenuService {
	List<PizzaMenuVo> seletList();

	PizzaMenuVo selectSize();
	PizzaMenuVo selectTopping();
	PizzaMenuVo selectSide();
	
	int insertMenu(PizzaMenuVo vo);

	int updateMenu(PizzaMenuVo vo);

	int deleteMenu(int meId);
}
