$(function () {
    $(".faq-tabbable").find("li").each(function () {
        var a = $(this).find("a:first")[0];
        if ($(a).attr("href") === location.pathname) {
            $(this).addClass("active");
        } else {
            $(this).removeClass("active");
        }
    });
    $("#id_clothes").change(function () {
        $("id_amount").val(0);
        var page = "/clothes/checkstock/";
        var clothes_id = $(this).val();
        $.ajax({
            url: page + clothes_id,
            success: function (result) {
                $("#checkResult").text("剩余库存：" + result.stock).css("color", "green");
            }
        })
    });
    $("#id_amount").keyup(function () {
        var page = "/clothes/checkstock/";
        var amount = $(this).val();
        var clothes_id = $("#id_clothes").val();
        $.ajax({
            url: page + clothes_id,
            success: function (result) {
                if (result.stock < amount) {
                    $("#checkResult").text("剩余库存：" + result.stock + "，库存不足！").css("color", "red");
                } else {
                    $("#checkResult").text("剩余库存：" + result.stock).css("color", "green");
                }

            }
        })
    });
    $("#id_username").keyup(function () {
        var page = "/checkusername/";
        var username = $(this).val();
        $.ajax({
            url: page + username,
            success: function (result) {
                if (result.ret == 1) {
                    $("#checkUsername").text(result.msg).css("color", "red")
                } else {
                    $("#checkUsername").text(result.msg).css("color", 'green')
                }
            }
        })
    });
    $("#id_captcha_1").addClass("form-control")
});