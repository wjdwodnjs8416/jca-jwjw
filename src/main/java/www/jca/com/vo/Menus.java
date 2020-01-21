package www.jca.com.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Menus {
	int id;
	String title;
	int parent;
	String url;
	Menus prev;
	Menus next;
	List<Menus> children;
	String pageComment;
	
	public Menus() {
		this.children = new ArrayList<Menus>();
	}
	public static Menus newInstance(int id) {
		Menus menu = new Menus();
		menu.setId(id);
		return menu;
	}
}
