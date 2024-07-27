<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="../../../../common/taglib.jsp"%>
<c:url var="buildingAPI" value="/api/building"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>
        Them
    </title>
</head>

<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>
                <li class="active">Dashboard</li>
            </ul><!-- /.breadcrumb -->

            <div class="nav-search" id="nav-search">
                <form class="form-search">
                            <span class="input-icon">
                                <input type="text" placeholder="Search ..." class="nav-search-input"
                                       id="nav-search-input" autocomplete="off" />
                                <i class="ace-icon fa fa-search nav-search-icon"></i>
                            </span>
                </form>
            </div><!-- /.nav-search -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>Sửa tòa nhà</h1>
            </div><!-- /.page-header -->
            <form:form id="form-edit" action="" modelAttribute="buildingEdit">
                <div class="form-group row">
                    <label for="name" class="col-sm-2 col-form-label">Tên tòa nhà</label>
                    <div class="col-sm-10">
<%--                        <input type="text" class="form-control" id="name" name="name">--%>
                        <form:input path="name" class="form-control"></form:input>
                    </div>
                </div>
                <div class="form-group col-md-3" style="margin-right: 10px;">
                    <label for="name">Quận</label>
                    <br>
                    <form:select path="district">
                        <form:option value="">--Chọn quận--</form:option>
                        <form:options items="${districts}"/>
                    </form:select>
                </div>
<%--                <div class="form-group row">--%>
<%--                    <label for="name" class="col-sm-2 col-form-label">Quận</label>--%>
<%--                    <div class="col-sm-10">--%>
<%--                        <select class="form-control" id="exampleFormControlSelect1" name="districtId" id="districtId">--%>
<%--                            <option value="">1</option>--%>
<%--                            <option value="">2</option>--%>
<%--                            <option value="">3</option>--%>
<%--                            <option>4</option>--%>
<%--                            <option>5</option>--%>
<%--                        </select>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <div class="form-group row">
                    <label for="name" class="col-sm-2 col-form-label">Đường</label>
                    <div class="col-sm-10">
                        <form:input path="street" class="form-control"></form:input>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-2 col-form-label">Phường</label>
                    <div class="col-sm-10">
                        <form:input path="ward" class="form-control"></form:input>
                    </div>
                </div>
<%--                <div class="form-group row">--%>
<%--                    <label for="name" class="col-sm-2 col-form-label">kết cấu</label>--%>
<%--                    <div class="col-sm-10">--%>
<%--                        <form:input path="name" class="form-control"></form:input>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <div class="form-group row">
                    <label for="name" class="col-sm-2 col-form-label">Số tầng hầm</label>
                    <div class="col-sm-10">
                        <form:input path="numberOfBasement" class="form-control"></form:input>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-2 col-form-label">Diện tích sàn</label>
                    <div class="col-sm-10">
                        <form:input path="floorArea" class="form-control"></form:input>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-2 col-form-label">Hướng</label>
                    <div class="col-sm-10">
                        <form:input path="direction" class="form-control"></form:input>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-2 col-form-label">Hạng</label>
                    <div class="col-sm-10">
                        <form:input path="level" class="form-control"></form:input>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-2 col-form-label">Diện tích thuê</label>
                    <div class="col-sm-10">
                        <form:input path="area" class="form-control"></form:input>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-2 col-form-label">Gía thuê</label>
                    <div class="col-sm-10">
                        <form:input path="rent" class="form-control"></form:input>
                    </div>
                </div>
<%--                <div class="form-group row">--%>
<%--                    <label for="name" class="col-sm-2 col-form-label">Mô tả giá</label>--%>
<%--                    <div class="col-sm-10">--%>
<%--                        <form:input path="name" class="form-control"></form:input>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group row">--%>
<%--                    <label for="name" class="col-sm-2 col-form-label">Phí dịch vụ</label>--%>
<%--                    <div class="col-sm-10">--%>
<%--                        <form:input path="name" class="form-control"></form:input>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group row">--%>
<%--                    <label for="name" class="col-sm-2 col-form-label">Phí ô tô</label>--%>
<%--                    <div class="col-sm-10">--%>
<%--                        <form:input path="name" class="form-control"></form:input>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group row">--%>
<%--                    <label for="name" class="col-sm-2 col-form-label">Phí mô tô</label>--%>
<%--                    <div class="col-sm-10">--%>
<%--                        <form:input path="name" class="form-control"></form:input>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group row">--%>
<%--                    <label for="name" class="col-sm-2 col-form-label">Phí ngoài giờ</label>--%>
<%--                    <div class="col-sm-10">--%>
<%--                        <form:input path="name" class="form-control"></form:input>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group row">--%>
<%--                    <label for="name" class="col-sm-2 col-form-label">Tiền điện</label>--%>
<%--                    <div class="col-sm-10">--%>
<%--                        <form:input path="name" class="form-control"></form:input>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group row">--%>
<%--                    <label for="name" class="col-sm-2 col-form-label">Đặt cọc</label>--%>
<%--                    <div class="col-sm-10">--%>
<%--                        <form:input path="name" class="form-control"></form:input>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group row">--%>
<%--                    <label for="name" class="col-sm-2 col-form-label">Thanh toán</label>--%>
<%--                    <div class="col-sm-10">--%>
<%--                        <form:input path="name" class="form-control"></form:input>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group row">--%>
<%--                    <label for="name" class="col-sm-2 col-form-label">Thời hạn thuê</label>--%>
<%--                    <div class="col-sm-10">--%>
<%--                        <form:input path="name" class="form-control"></form:input>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group row">--%>
<%--                    <label for="name" class="col-sm-2 col-form-label">Thời gian trang trí</label>--%>
<%--                    <div class="col-sm-10">--%>
<%--                        <form:input path="name" class="form-control"></form:input>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <div class="form-group row">
                    <label for="name" class="col-sm-2 col-form-label">Tên QL</label>
                    <div class="col-sm-10">
                        <form:input path="managerName" class="form-control"></form:input>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-2 col-form-label">SDT QL</label>
                    <div class="col-sm-10">
                        <form:input path="managerPhone" class="form-control"></form:input>
                    </div>
                </div>
<%--                <div class="form-group row">--%>
<%--                    <label for="name" class="col-sm-2 col-form-label">Phí môi giới</label>--%>
<%--                    <div class="col-sm-10">--%>
<%--                        <form:input path="name" class="form-control"></form:input>--%>
<%--                    </div>--%>
<%--                </div>--%>
               //
<%--                <div class="form-group row">--%>
<%--                    <label for="name" class="col-sm-2 col-form-label">Ghi chú</label>--%>
<%--                    <div class="col-sm-10">--%>
<%--                        <form:input path="name" class="form-control"></form:input>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <div class="form-group col-md-3" style="margin-right: 10px;">
                    <form:checkboxes items="${typeCodes}" path="typeCode" />
                </div>
                <form:hidden path="id" id="buildingId"/>
            </form:form>
            <c:if test="${not empty buildingEdit.id}">
                <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">sua</button>
            </c:if>
            <c:if test="${empty buildingEdit.id}">
                <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">them</button>
            </c:if>
            <button type="button" class="btn btn-danger" id="btnCancel">Cancel</button>
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
</div><!-- /.main-container -->

<script>
    $('#btnAddOrUpdateBuilding').click(function(){
        var data = {};
        var typeCode = [];
        var formData = $('#form-edit').serializeArray();
        $.each(formData, function(i, v){
            if (v.name != 'typeCode'){
                data["" + v.name + ""] = v.value;
            }
            else{
                typeCode.push(v.value);
            }
        })
        data['typeCode'] = typeCode;
        console.log("ok");
        if(typeCode != ''){
            addOrUpdateBuilding(data);
        }
        else {
            window.location.href = "<c:url value="/admin/building-edit?typeCode=require"/>"
        }
    });
    function addOrUpdateBuilding(data){
        // call api => dung ajax, jquery
        $.ajax({
            type: "POST",
            url : "${buildingAPI}",
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
    $('#btnCancel').click(function (){
        window.location.href = "/admin/building-list"
    })
</script>

</body>

</html>