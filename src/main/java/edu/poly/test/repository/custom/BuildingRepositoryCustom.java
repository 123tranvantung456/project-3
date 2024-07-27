package edu.poly.test.repository.custom;

import edu.poly.test.entity.BuildingEntity;
import edu.poly.test.model.request.BuildingSearchRequest;

import java.util.List;

public interface BuildingRepositoryCustom {
    List<BuildingEntity> findAll(BuildingSearchRequest buildingSearchRequest);
}
