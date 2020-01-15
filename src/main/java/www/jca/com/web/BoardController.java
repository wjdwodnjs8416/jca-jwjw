package www.jca.com.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface BoardController<T> {
	public ModelAndView getListView(ModelAndView mv, T model);
	public ModelAndView getDetailView(ModelAndView mv, T model, String type);
	public ModelAndView getEditView(ModelAndView mv, T model, HttpServletRequest request, String type);
	public ModelAndView getWriteView(ModelAndView mv, T model, HttpServletRequest request, String type);
	public String write(T model, String type);
	public String edit(T model, String type);
	public String delete(T model, String type);
}
