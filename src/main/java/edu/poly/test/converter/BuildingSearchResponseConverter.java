package edu.poly.test.converter;


import edu.poly.test.entity.BuildingEntity;
import edu.poly.test.entity.RentAreaEntity;
import edu.poly.test.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class BuildingSearchResponseConverter {
    @Autowired
    private ModelMapper modelMapper;
    public BuildingSearchResponse toBuildingSearchResponse(BuildingEntity buildingEntity) {
        BuildingSearchResponse result = modelMapper.map(buildingEntity, BuildingSearchResponse.class);
        result.setAddress(buildingEntity.getStreet() + buildingEntity.getWard() + buildingEntity.getDistrict());
        List<RentAreaEntity> rentAreas = buildingEntity.getRentAreaEntities();
        String rentArea = rentAreas.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(", "));
        result.setRentArea(rentArea);
        return result;
    }
}
