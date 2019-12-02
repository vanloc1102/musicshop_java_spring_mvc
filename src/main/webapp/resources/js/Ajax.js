//$(document).ready(function() {
//
//    // Do GET all Customers from Back-End with JQUERY AJAX
//    $(function () {
//        $.ajax({
//            type : "GET",
//            url : window.location + "api/customer/all",
//            success: function(result){
//                $.each(result, function(index, customer){
//
//                    var customerRow = '<tr>' +
//                        '<td>' + index + '</td>' +
//                        '<td>' + customer.name.toUpperCase() + '</td>' +
//                        '<td>' + customer.age + '</td>' +
//                        '<td>' + customer.address.street + '</td>' +
//                        '<td>' + customer.address.postcode + '</td>' +
//                        '<td class="text-center">' +
//                        '<input type="hidden" value=' + customer.id + '>' +
//                        '<a>' +
//                        '<span class="glyphicon glyphicon-remove"></span>' +
//                        '</a>' +
//                        '</td>' +
//                        '</tr>';
//
//                    $('#customerTable tbody').append(customerRow);
//
//                });
//
//                $( "#customerTable tbody tr:odd" ).addClass("info");
//                $( "#customerTable tbody tr:even" ).addClass("success");
//            },
//            error : function(e) {
//                alert("ERROR: ", e);
//                console.log("ERROR: ", e);
//            }
//        });
//    });
//
//    // Do DELETE a Customer via JQUERY AJAX
//    $(document).on("click","a",function() {
//
//        var customerId = $(this).parent().find('input').val();
//        var workingObject = $(this);
//
//        $.ajax({
//            type : "DELETE",
//            url : window.location + "api/customer/delete/" + customerId,
//            success: function(resultMsg){
//                $("#resultMsgDiv").html("<p style='background-color:#67597E; color:white; padding:20px 20px 20px 20px'>" +
//                    "Customer with Id=" + customerId + " is deleted successfully!"  +
//                    "</p>");
//
//                workingObject.closest("tr").remove();
//
//                // re-css for table
//                $( "#customerTable tbody tr:odd" ).addClass("info");
//                $( "#customerTable tbody tr:even" ).addClass("success");
//            },
//            error : function(e) {
//                alert("ERROR: ", e);
//                console.log("ERROR: ", e);
//            }
//        });
//    });
//});