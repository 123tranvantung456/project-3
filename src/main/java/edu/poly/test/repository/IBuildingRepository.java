package edu.poly.test.repository;

import edu.poly.test.entity.BuildingEntity;
import edu.poly.test.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IBuildingRepository extends JpaRepository<BuildingEntity, Long> {
}
