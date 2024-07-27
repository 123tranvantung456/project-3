package edu.poly.test.api;

import edu.poly.test.model.dto.AssignmentBuildingDTO;
import edu.poly.test.model.dto.BuildingDTO;
import edu.poly.test.model.response.ResponseDTO;
import edu.poly.test.service.impl.BuildingService;
import org.eclipse.jdt.internal.compiler.ast.Assignment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "buildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {
    @Autowired
    private BuildingService buildingService;

    @PostMapping
    public void AddOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO){
        // xuong db
        System.out.println("oke");
    }
    @DeleteMapping("/{ids}")
    public void DeleteBuilding(@PathVariable List<Long> ids){
        // xuong db
        System.out.println("ok");
    }
    @GetMapping("{id}/staffs")
    public ResponseDTO loadStaff(@PathVariable Long id){
        ResponseDTO result = buildingService.listStaffs(id);
        return result;
    }
    @PostMapping("/assignment")
    public void updateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
        System.out.println("ok");
    }
}
