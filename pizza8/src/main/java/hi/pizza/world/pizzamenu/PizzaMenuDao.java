package hi.pizza.world.pizzamenu;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface PizzaMenuDao {
	List<PizzaMenuVo> seletList();
	

	PizzaMenuVo selectSize();
	PizzaMenuVo selectTopping();
	PizzaMenuVo selectSide();
	
	int insertMenu(PizzaMenuVo vo);

	int updateMenu(PizzaMenuVo vo);

	int deleteMenu(int meId);
}
