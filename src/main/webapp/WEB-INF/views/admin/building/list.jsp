<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="../../../../common/taglib.jsp"%>

<c:url var="buildingListURL" value="/admin/building-list" />
<c:url var="buildingAPI" value="/api/building"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>
        Danh sách Tòa nhà
    </title>
</head>

<body>
<div class="main-content">
        <div class="main-content">
            <div class="main-content-inner">
                <div class="page-content">
                    <div class="page-header">
                        <h1>
                            Danh sách tòa nhà
                        </h1>
                    </div><!-- /.page-header -->

                    <div style="border: 1px solid navy; margin: 20px;">
                        <div class="container">
                            <h3>Tìm Kiếm</h3>

                            <form:form action="${buildingListURL}" id="listForm" method="GET" modelAttribute="modelSearch" >
                                <div class="form-group col-md-3" style="margin-right: 10px;">
                                    <label for="name">Tên tòa nhà</label>
<%--                                    <input type="text" class="form-control" name="name" value="${modelSearch.getName()}">--%>
                                    <form:input path="name" class="form-control"></form:input>
                                </div>
                                <div class="form-group col-md-3" style="margin-right: 10px;">
                                    <label for="name">Diện tích sàn</label>
<%--                                    <input type="number" class="form-control" name="floorArea" value="">--%>
                                    <form:input path="floorArea" class="form-control"></form:input>
                                </div>

                                <div class="form-group col-md-3" style="margin-right: 10px;">
                                    <label for="name">Quận</label>
                                    <br>
                                    <form:select path="district">
                                        <form:option value="">--Chọn quận--</form:option>
                                        <form:options items="${districts}"/>
                                    </form:select>
                                </div>
                                <div class="form-group col-md-3" style="margin-right: 10px;">
                                    <label for="name">Phường</label>
<%--                                    <input type="text" class="form-control" id="ward" name="ward" value="">--%>
                                    <form:input path="ward" class="form-control"></form:input>
                                </div>
                                <div class="form-group col-md-3" style="margin-right: 10px;">
                                    <label for="name">Đường</label>
<%--                                    <input type="text" class="form-control" id="street" name="street" value="">--%>
                                    <form:input path="street" class="form-control"></form:input>
                                </div>
                                <div class="form-group col-md-3" style="margin-right: 10px;">
                                    <label for="name">Số tầng hầm</label>
<%--                                    <input type="number" class="form-control" id="numberOfBasement" name="numberOfBasement">--%>
                                    <form:input path="numberOfBasement" class="form-control"></form:input>
                                </div>
                                <div class="form-group col-md-3" style="margin-right: 10px;">
                                    <label for="name">Hướng</label>
<%--                                    <input type="text" class="form-control" id="name" name="">--%>
                                    <form:input path="direction" class="form-control"></form:input>
                                </div>

                                <div class="form-group col-md-3" style="margin-right: 10px;">
                                    <label for="name">Hạng</label>
<%--                                    <input type="text" class="form-control" id="name" name="">--%>
                                    <form:input path="level" class="form-control"></form:input>
                                </div>
                                <div class="form-group col-md-3" style="margin-right: 10px;">
                                    <label for="name">Diện tích từ</label>
<%--                                    <input type="number" class="form-control" id="name" name="">--%>
                                    <form:input path="areaFrom" class="form-control"></form:input>
                                </div>
                                <div class="form-group col-md-3" style="margin-right: 10px;">
                                    <label for="name">Diện tích đến</label>
<%--                                    <input type="number" class="form-control" id="name" name="">--%>
                                    <form:input path="areaTo" class="form-control"></form:input>
                                </div>
                                <div class="form-group col-md-3" style="margin-right: 10px;">
                                    <label for="name">Gía thuê từ</label>
<%--                                    <input type="number" class="form-control" id="name" name="">--%>
                                    <form:input path="rentPriceFrom" class="form-control"></form:input>
                                </div>

                                <div class="form-group col-md-3" style="margin-right: 10px;">
                                    <label for="name">Gía thuê đến</label>
<%--                                    <input type="number" class="form-control" id="name" name="">--%>
                                    <form:input path="rentPriceTo" class="form-control"></form:input>
                                </div>
                                <div class="form-group col-md-3" style="margin-right: 10px;">
                                    <label for="name">Tên quản lí</label>
<%--                                    <input type="text" class="form-control" id="name" name="">--%>
                                    <form:input path="managerName" class="form-control"></form:input>
                                </div>
                                <div class="form-group col-md-3" style="margin-right: 10px;">
                                    <label for="name">SDT Quản lí</label>
<%--                                    <input type="number" class="form-control" id="name" name="">--%>
                                    <form:input path="managerPhone" class="form-control"></form:input>
                                </div>
                                <div class="form-group col-md-3" style="margin-right: 10px;">
                                    <label for="name">Nhân viên</label>
                                    <br>
                                    <form:select path="staffId">
                                        <form:option value="">Chọn nhân viên</form:option>
                                        <form:options items="${listStaffs}"/>
                                    </form:select>
                                </div>
                                <div class="form-group col-md-3" style="margin-right: 10px;">
                                    <form:checkboxes items="${typeCodes}" path="typeCode" />
                                </div>
<%--                                <div class="form-group col-md-3" style="margin-right: 10px;">--%>
<%--                                    <div class="form-check form-check-inline">--%>
<%--                                        <input class="form-check-input" type="checkbox" id="11"--%>
<%--                                               value="tang-tret" name="typeCode">--%>
<%--                                        <label class="form-check-label" for="11">tang tret</label>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-check form-check-inline">--%>
<%--                                        <input class="form-check-input" type="checkbox" id="22"--%>
<%--                                               value="noi-that" name="typeCode">--%>
<%--                                        <label class="form-check-label" for="11">noi that</label>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-check form-check-inline">--%>
<%--                                        <input class="form-check-input" type="checkbox" id="33"--%>
<%--                                               value="nguyen-can" name="typeCode">--%>
<%--                                        <label class="form-check-label" for="11">nguyen cans</label>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                            </form:form>
                            <button type="button" class="btn btn-primary" id="btnSearchBuilding">Tìm kiếm</button>
                            <a href="/admin/building-edit">
                                <button type="button" class="btn btn-success">Thêm tòa nhà</button>
                            </a>
                            <button type="button" class="btn btn-danger" id="btnDeleteBuilding">Xóa</button>
                        </div>
                    </div>

                    <div class="col-xs-12">
                        <table id="tableList" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" name="checkList" value="">
                                        <span class="lbl"></span>
                                    </label>
                                </th>
                                <th>Tên tòa nhà</th>
                                <th>Địa chỉ</th>
                                <th>Số tầng hầm</th>
                                <th>Tên QL</th>
                                <th>SDT QL</th>
                                <th>DT sàn</th>
                                <th>DT trống</th>
                                <th>DT thuê</th>
                                <th>Phí môi giới</th>
                                <th>Gía thuê</th>
                                <th>Phí dịch vụ</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="it" items="${buildingList}">
                                <tr>
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace" name="checkList" value="${it.id}">
                                            <span class="lbl"></span>
                                        </label>
                                    </td>
                                    <td>
                                        ${it.name}
                                    </td>
                                    <td>
                                        ${it.address}
                                    </td>
                                    <td>

                                    </td>
                                    <td>
                                        @
                                    </td>
                                    <td>
                                        @
                                    </td>
                                    <td>
                                        @
                                    </td>
                                    <td>
                                        @
                                    </td>
                                    <td>
                                        @
                                    </td>
                                    <td>
                                        @
                                    </td>
                                    <td>
                                        @
                                    </td>
                                    <td>
                                        @
                                    </td>

                                    <td>
                                        <div class="hidden-sm hidden-xs btn-group">
                                            <button class="btn btn-xs btn-success" onclick="assignmentBuilding(${it.id})">
                                                Giao
                                            </button>
                                            <a href="/admin/building-edit-${it.id}">
                                                <button class="btn btn-xs btn-info">
                                                    Sửa
                                                </button>
                                            </a>
                                            <button class="btn btn-xs btn-danger" title="xóa tòa nhà" onclick="deleteBuilding(${item.id})">
                                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                            </button>

                                        </div>

                                    </td>

                                </tr>
                            </c:forEach>


                            </tbody>
                        </table>
                    </div>
                </div><!-- /.page-content -->
            </div>
        </div><!-- /.main-content -->
    </div><!-- /.main-container -->

    <!-- Modal -->
    <div class="modal fade" id="assignmentBuildingModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Giao tòa nhà</h5>
                </div>
                <div class="modal-body">
                    <table id="staffList" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">
                                Chọn
                            </th>
                            <th>Tên NV</th>
                        </tr>
                        </thead>

                        <tbody>

                        </tbody>
                    </table>
                    <input type="hidden" name="buildingId" id="buildingId" value="">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="btnAssignmentBuilding">OK</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function assignmentBuilding(buildingId) {
        $('#assignmentBuildingModal').modal();
        loadStaff(buildingId);
        $('#buildingId').val(buildingId);
    }

    function loadStaff(buildingId){
        $.ajax({
            type: "GET",
            url : "${buildingAPI}/"+ buildingId +'/staffs',
            dataType: "JSON",
            success: function(response){
                var row = '';
                $.each(response.data, function (index, item){
                   row += '<tr>';
                   row += '<td class= "text-center"><input type="checkbox" value=' + item.staffId + ' ' + item.checked + '/></td>'
                   row += '<td class= "text-center">' + item.fullName + '</td>';
                   row += '</tr>'
                });
                $('#staffList tbody').html(row);
                console.info("thanh cong");
                console.log("success");
            },
            error: function(response){
                console.log("failed");
                window.location.href = "<c:url value="/admin/building-list?message=error"/>"
            }
        })
    }

    $('#btnAssignmentBuilding').click(function(e){
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        if (data['staffs'] != ''){
            assignment(data);
        }
    })
    function assignment(data){
        $.ajax({
            type: "POST",
            url : "${buildingAPI}/" + 'assignment',
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function(respond){
                console.log("success");
            },
            error: function(respond){
                console.log("failed");
                window.location.href = "<c:url value="/admin/building-list?message=error"/>"
            }
        })
    }
</script>
<script>
    $('#btnSearchBuilding').click(function(e){
        e.preventDefault(); //
        $('#listForm').submit();
    })

    function deleteBuilding(data){
        var buildingId = [data];
       deleteBuildings(buildingId);
    }

    $('#btnDeleteBuilding').click(function(e){
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        var buildingIds = $('#tableList').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        deleteBuildings(buildingIds);
    })

    function deleteBuildings(data){
        $.ajax({
            type: "Delete",
            url : "${buildingAPI}/" + data,
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function(respond){
                console.log("success");
            },
            error: function(respond){
                console.log("failed");
            }
        })
    }
</script>
</body>

</html>

<%--// bam giao -> load form + set the input buildingId -> bam ok -> lay lai buildingId tu input + cac nguoi dung dc chon--%>