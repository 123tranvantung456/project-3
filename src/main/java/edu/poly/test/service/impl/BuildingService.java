package edu.poly.test.service.impl;

import edu.poly.test.entity.BuildingEntity;
import edu.poly.test.entity.UserEntity;
import edu.poly.test.model.request.BuildingSearchRequest;
import edu.poly.test.model.response.BuildingSearchResponse;
import edu.poly.test.model.response.ResponseDTO;
import edu.poly.test.model.response.StaffResponseDTO;
import edu.poly.test.repository.IBuildingRepository;
import edu.poly.test.repository.IUserRepository;
import edu.poly.test.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BuildingService implements IBuildingService {
    @Autowired
    private IBuildingRepository buildingRepository;
    @Autowired
    private IUserRepository userRepository;
    @Override
    public ResponseDTO listStaffs(Long buildingId){
        BuildingEntity building = buildingRepository.findById(buildingId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> staffAssignment = building.getUserEntities();
        List<StaffResponseDTO> staffResponseDTOs = new ArrayList<>();
        ResponseDTO result = new ResponseDTO();
        for(UserEntity staff : staffs){
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setStaffId(staff.getId());
            staffResponseDTO.setFullName(staff.getFullName());
            if(staffAssignment.contains(staff)){
                staffResponseDTO.setChecked("checked");
            }
            else {
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOs.add(staffResponseDTO);
        }
        result.setData(staffResponseDTOs);
        result.setMessage("success!");
        return result;
    }

    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest) {
        return List.of();
    }
}
