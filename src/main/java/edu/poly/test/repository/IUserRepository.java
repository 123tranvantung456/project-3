package edu.poly.test.repository;

import edu.poly.test.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IUserRepository extends JpaRepository<UserEntity, Long> {
    List<UserEntity> findByStatusAndRoles_Code(Integer status, String role);
}
