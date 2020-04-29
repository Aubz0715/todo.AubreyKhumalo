package io.jumpco.demo.todo.controller;

import io.jumpco.demo.todo.model.EntityNotFoundException;
import io.jumpco.demo.todo.model.Todo;
import io.jumpco.demo.todo.model.TodoService;
import org.apache.catalina.filters.ExpiresFilter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

@Controller
public class TodoController {
    private TodoService todoService;

    public TodoController(TodoService todoService) {
        this.todoService = todoService;
    }

    @RequestMapping("/todo/create")
    public ModelAndView startCreate() {
        ModelAndView result = new ModelAndView("add-edit");
        result.addObject("mode", "add");
        result.addObject("modeTitle", "Create");
        result.addObject("todo", new Todo());
        result.addObject("todoType", "type");
        return result;
    }

    @GetMapping("/todo/edit/{id}")
    public ModelAndView startEdit(@PathVariable("id") Long id) throws EntityNotFoundException {
        Todo item = todoService.find(id);
        ModelAndView result = new ModelAndView("add-edit");
        result.addObject("mode", "update");
        result.addObject("modeTitle", "Update");
        result.addObject("todo", item);
        return result;
    }

    @PostMapping(params = "cancel", path = "/todo/add")
    public View cancelAdd() {
        return home();
    }

    @PostMapping(params = "cancel", path = "/todo/update")
    public View cancelUpdate() {
        return home();
    }

    @PostMapping("/todo/update")
    public View update(@Valid @ModelAttribute Todo todo) throws EntityNotFoundException {
        todoService.update(todo);
        return home();
    }

    //@PostMapping("/todo/add")

    //public View create(@Valid @ModelAttribute Todo todo) {
     //   todoService.create(todo);
     //return home();
    @PostMapping("/todo/add")
    public ModelAndView create(@Valid @ModelAttribute Todo todo, BindingResult bindingResult, Model mode) {
        if(bindingResult.hasErrors()){
            ModelAndView results = new ModelAndView("add-edit");
            results.addAllObjects(mode.asMap());
            results.addObject("mode","add");
            results.addObject("modeTitle","create");
            return results;
        }
        todoService.create(todo);
        return new ModelAndView("redirect:/");

    }


    @GetMapping(value = "/todo/delete/{id}")
    public View delete(@PathVariable("id") Long id) {
        todoService.delete(id);
        return home();
    }

    @GetMapping(value = "/todo/complete/{id}")
    public View complete(@PathVariable("id") Long id) throws EntityNotFoundException {
        todoService.complete(id);
        return home();
    }

    private RedirectView home() {
        return new RedirectView("/");
    }

    @GetMapping("/")
    public ModelAndView index() {
        ModelAndView result = new ModelAndView("index");
        result.addObject("todos", todoService.list(null));
        return result;
    }
    protected Map referenceData(HttpServletRequest request){
        Map referenceData = new HashMap();
        Map<String,String> type = new LinkedHashMap<String, String>();
        type.put("TASK", "Task");
        type.put("BUG", "Bug");
        type.put("FEATURE", "Feature");
        type.put("ENHANCEMENT", "Enhancement");
        type.put("MAINTENANCE", "Task");
        referenceData.put("TodoType", type);
        return type;
    }
}
