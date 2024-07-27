package edu.poly.test.service;

import edu.poly.test.entity.BuildingEntity;
import edu.poly.test.model.request.BuildingSearchRequest;
import edu.poly.test.model.response.BuildingSearchResponse;
import edu.poly.test.model.response.ResponseDTO;

import java.util.List;

public interface IBuildingService {
    ResponseDTO listStaffs(Long buildingId);
    List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest);
}
