package edu.poly.test.controller.admin;

import edu.poly.test.enums.District;
import edu.poly.test.enums.TypeCode;
import edu.poly.test.model.dto.BuildingDTO;
import edu.poly.test.model.request.BuildingSearchRequest;
import edu.poly.test.model.response.BuildingSearchResponse;
import edu.poly.test.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    IUserService userService;
    @RequestMapping(value = "/admin/building-list", method = RequestMethod.GET)
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest){
        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("modelSearch", buildingSearchRequest);
        List<BuildingSearchResponse> responseList =

        mav.addObject("buildingList", responseList);
        mav.addObject("listStaffs", userService.getStaffs());
        mav.addObject("districts", District.type());
        mav.addObject("typeCodes", TypeCode.type());

        return mav;
    }
    @RequestMapping(value = "/admin/building-edit", method = RequestMethod.GET)
    public ModelAndView buildingEdit(@ModelAttribute("buildingEdit") BuildingDTO buildingDTO){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("districts", District.type());
        mav.addObject("typeCodes", TypeCode.type());
        return mav;
    }
    @RequestMapping(value = "/admin/building-edit-{id}", method = RequestMethod.GET)
    public ModelAndView buildingEdit(@PathVariable Long id){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        BuildingDTO buildingDTO = new BuildingDTO();
        buildingDTO.setName("123");
        buildingDTO.setId(id);
        mav.addObject("buildingEdit", buildingDTO);
        mav.addObject("districts", District.type());
        mav.addObject("typeCodes", TypeCode.type());
        return mav;
    }
}
