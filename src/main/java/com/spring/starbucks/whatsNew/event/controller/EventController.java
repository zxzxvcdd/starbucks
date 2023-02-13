package com.spring.starbucks.whatsNew.event.controller;

import com.spring.starbucks.whatsNew.event.domain.Event;
import com.spring.starbucks.whatsNew.event.service.EventService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/whats_new/event")
public class EventController {

    private final EventService eventService;

    @GetMapping("/list")
    public String list( String kind, Model model){

        List<Event> events =  eventService.findAllService();
        model.addAttribute("events", events);
        model.addAttribute("kind", kind);
        log.info("events - {}", events);
        log.info("kind - {}", kind);

        return "whats_new/event/eventList";
    }

    @GetMapping("/detail")
    public String detail(int id, String kind, Model model){
        Event event = eventService.findOneService(id);
        List<Event> events = eventService.findAllService();

        model.addAttribute("kind", kind);
        model.addAttribute("event", event);
        model.addAttribute("events", events);
        return "whats_new/event/eventDetail";
    }

}
