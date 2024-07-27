package edu.poly.test.service.impl;

import edu.poly.test.entity.UserEntity;
import edu.poly.test.repository.IUserRepository;
import edu.poly.test.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class UserService implements IUserService {
    @Autowired
    IUserRepository userRepository;
    @Override
    public Map<Long, String> getStaffs() {
        Map<Long, String> liststaffs = new HashMap<Long, String>();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        for(UserEntity staff : staffs){
            liststaffs.put(staff.getId(), staff.getUserName());
        }
        return liststaffs;
    }
}
