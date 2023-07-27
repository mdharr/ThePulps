package com.skilldistillery.thepulps.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.MagazineEditor;
import com.skilldistillery.thepulps.services.MagazineEditorService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class MagazineEditorController {
	
	@Autowired
	private MagazineEditorService magazineEditorService;
	
	@GetMapping("magazines/{mid}/editor")
	public MagazineEditor getMagazineEditorByMagazineId(@PathVariable("mid") int magazineId, HttpServletResponse res, HttpServletRequest req) {
		return magazineEditorService.getMagazineEditorByMagazineId(magazineId);
	}

}
