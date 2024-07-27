package edu.poly.test.repository.custom.impl;

import edu.poly.test.entity.BuildingEntity;
import edu.poly.test.model.request.BuildingSearchRequest;
import edu.poly.test.model.response.BuildingSearchResponse;
import edu.poly.test.repository.custom.BuildingRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    public void joinTable(BuildingSearchRequest buildingSearchRequest, StringBuilder sql) {
        Long staffId = buildingSearchRequest.getStaffId();
        if (staffId != null) {
            sql.append("INNER JOIN assignmentbuilding ON b.id = assignmentbuilding.buildingid ");
        }
        List<String> typeCode = buildingSearchRequest.getTypeCode();
        if (typeCode != null && typeCode.size() != 0) {
            sql.append("INNER JOIN buildingrenttype ON b.id = buildingrenttype.buildingid ");
            sql.append("INNER JOIN renttype ON buildingrenttype.renttypeid = renttype.id ");
        }
        Long areaFrom = buildingSearchRequest.getAreaFrom();
        Long areaTo = buildingSearchRequest.getAreaTo();
        if (areaFrom != null || areaTo != null) {
            sql.append("INNER JOIN rentarea ON b.id = rentarea.buildingid ");
        }
    }

    public void queryNormal(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
        try {
            Field[] fields = BuildingSearchRequest.class.getDeclaredFields();
            for (Field item : fields) {
                item.setAccessible(true);
                String fieldName = item.getName();
                if (!fieldName.equals("staffId") && !fieldName.equals("typeCode") && !fieldName.startsWith("area")
                        && !fieldName.startsWith("price")) {
                    Object value = item.get(buildingSearchRequest);
                    if (value != null) {
                        if (item.getType().getName().equals("java.lang.Long") || item.getType().getName().equals("java.lang.Integer")
                                || item.getType().getName().equals("java.lang.Float")) {
                            where.append("AND b." + fieldName + " = " + value + " ");
                        } else {
                            where.append("AND b." + fieldName + " like '%" + value + "%' ");
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void querySpecial(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
        Long staffId = buildingSearchRequest.getStaffId();
        if (staffId != null) {
            where.append("AND assignmentbuilding.staffId = " + staffId + " ");
        }
        List<String> typeCode = buildingSearchRequest.getTypeCode();
        if (typeCode != null && typeCode.size() != 0) {
            List<String> typeCodeTemp = new ArrayList<>();
            for (String str : typeCode) {
                typeCodeTemp.add("'" + str + "'");
            }
            where.append("AND renttype.code IN (" + String.join(",", typeCodeTemp) + ") ");
        }
        Long areaFrom = buildingSearchRequest.getAreaFrom();
        if (areaFrom != null) {
            where.append("AND rentarea.value >= " + areaFrom + " ");
        }
        Long areaTo = buildingSearchRequest.getAreaTo();
        if (areaTo != null) {
            where.append("AND rentarea.value <= " + areaTo + " ");
        }
        Long priceFrom = buildingSearchRequest.getRentPriceFrom();
        if (priceFrom != null) {
            where.append("AND b.rentprice >= " + priceFrom + " ");
        }
        Long priceTo = buildingSearchRequest.getRentPriceTo();
        if (priceTo != null) {
            where.append("AND b.rentprice <= " + priceTo + " ");
        }
    }
    @Override
    public List<BuildingEntity> findAll(BuildingSearchRequest buildingSearchRequest) {
        StringBuilder sql = new StringBuilder(
                "SELECT b.id, b.name, b.districtid, b.street, b.ward, b.numberofbasement, b.floorarea, b.rentprice, b.managerphonenumber, b.servicefee, b.brokeragefee FROM building b ");
        joinTable(buildingSearchRequest, sql);
        StringBuilder where = new StringBuilder("WHERE 1 = 1 ");
        queryNormal(buildingSearchRequest, where);
        querySpecial(buildingSearchRequest, where);
        sql.append(where);
        sql.append("GROUP BY b.id");
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }
}
