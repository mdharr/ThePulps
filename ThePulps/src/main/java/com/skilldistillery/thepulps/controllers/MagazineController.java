package com.skilldistillery.thepulps.controllers;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.Magazine;
import com.skilldistillery.thepulps.services.MagazineService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class MagazineController {
	
    @Autowired
    private MagazineService magazineService;
    
    @GetMapping("magazines")
    public List<Magazine> getAllMagazines() {
        return magazineService.getAllMagazines();
    }
    
    @GetMapping("magazines/{mid}")
    public Magazine getMagazineById(@PathVariable("mid") int magazineId, HttpServletResponse res) {
    	if(magazineService.getMagazineById(magazineId) == null) {
    		res.setStatus(404);
    	}
    	return magazineService.getMagazineById(magazineId);
    }

}
