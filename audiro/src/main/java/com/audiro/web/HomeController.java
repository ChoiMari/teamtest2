package com.audiro.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.audiro.service.TravelDestinationService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequiredArgsConstructor
public class HomeController {

	@GetMapping("/")
	public String getDestinations(Model model) {
		
		return "home";
	}
}
