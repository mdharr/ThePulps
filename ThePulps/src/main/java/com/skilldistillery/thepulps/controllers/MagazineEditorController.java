package com.skilldistillery.thepulps.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.Magazine;
import com.skilldistillery.thepulps.entities.MagazineEditor;
import com.skilldistillery.thepulps.services.MagazineEditorService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class MagazineEditorController {
	
	@Autowired
	private MagazineEditorService magazineEditorService;
	
	@GetMapping("magazine-editors")
	public List<MagazineEditor> getAllMagazineEditors() {
		return magazineEditorService.getAllMagazineEditors();
	}
	
	@GetMapping("editors/{meid}/magazines")
	public List<Magazine> getMagazinesByMagazineEditorId(@PathVariable("meid") int magazineEditorId, HttpServletRequest req, HttpServletResponse res) {
		return magazineEditorService.getAllMagazinesByMagazineEditorId(magazineEditorId);
	}
	
	@GetMapping("magazines/{mid}/editor")
	public MagazineEditor getMagazineEditorByMagazineId(@PathVariable("mid") int magazineId, HttpServletResponse res, HttpServletRequest req) {
		return magazineEditorService.getMagazineEditorByMagazineId(magazineId);
	}

}
