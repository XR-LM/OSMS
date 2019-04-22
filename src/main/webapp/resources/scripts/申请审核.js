$(function() {
    $('#itemEditWindow').window({
        width:600,
        height:400,
        modal:true,
        closed:true,
        iconCls:'icon-save',
        href:'add'
    });
    var columns = [ [ {
        field : 'ck',
        checkbox : true
    },{
        field : 'id',
        title : '序号',
        width : 60,
        align:'center'
    },
        {
            field : 'articleName1',
            title : '商品名称',
            width : 280,
            align:'center'
        },
        {
            field : 'userName',
            title : '申请人',
            width : 120,
            align:'center'
        },
        {
            field : 'applyNum',
            title : '申请数量',
            width : 100,
            align:'center'
        },
        {
            field : 'stockUnit1',
            title : '单位',
            width : 100,
            align:'center'
        },
        {
            field : 'opt',
            title : '审核',
            width : 100,
            align : 'center',
            formatter : function(value, rec) {
                var style="height: 18px;line-height: 18px;padding: 0 11px;background: #02bafa;border: 1px #26bbdb solid;border-radius: 3px;"+
                    "display: inline-block;text-decoration: none;font-size: 12px;outline: none;margin-right:5px";
                var style1="height: 18px;line-height: 18px;padding: 0 11px;background: #fff000;border: 1px #26bbdb solid;border-radius: 3px;"+
                    "display: inline-block;text-decoration: none;font-size: 12px;outline: none;"

                var btn = "<a onclick='applyok(\""+rec.id+"\")' style='"+style+"' href='javascript:void(0)'>通过</a><a onclick='applyrej(\""+rec.id+"\")' style='"+style1+"' href='javascript:void(0)'>驳回</a>";
                return btn;
            }
        } ] ];
    queryparms = {
        "pageNumber" : "1",
        "pageSize" : "10",
        "applystatus" : "0"
    };
    ini_table(queryparms, 'apply/list', columns);


    //查询
    $("#u597").click(function() {
        //获取申请人
        username = $("#u594_input").val();
        //获取申请时间
        applydate = $("#u765_input").val();

        applystatus=0;
        find(1, 10, 'apply/list');
    });
    //批量驳回申请
    $("#u979").click(function() {
        var ids = getSelectionsIds();
        if (ids.length == 0) {
            $.messager.alert('提示', '未选中商品!');
            return;
        }
        $.messager.confirm('确认','确定驳回所有选中的申请吗？',function(r){
            if (r){
                var params = {"ids":ids};
                $.post("apply/rejs",params, function(data){
                    if(data.status == 200){
                        $.messager.alert('提示','驳回申请成功!',undefined,function(){
                            $("#goodsList").datagrid("reload");
                        });
                    }
                });
            }
        });
    });

    //批量通过申请
    $("#u977").click(function() {
        var ids = getSelectionsIds();
        if (ids.length == 0) {
            $.messager.alert('提示', '未选中商品!');
            return;
        }
        $.messager.confirm('确认','确认要申请所有所有的选中项吗？',function(r){
            if (r){
                var params = {"ids":ids};
                $.post("apply/oks",params, function(data){
                    if(data.status == 200){
                        $.messager.alert('提示','批量申请成功!',undefined,function(){
                            $("#goodsList").datagrid("reload");
                        });
                    }
                });
            }
        });
    });
});
//申请通过
function applyok(id){
    $.messager.confirm('确认', '确定撤回选中的申请吗？', function(r) {
        if (r) {
            $.ajax({
                url: 'apply/ok',
                data: {id: id},
                type: 'POST',
                success: function (data) {
                    if (data.status == 200) {
                        $.messager.alert('提示', '已通过审核!', undefined, function () {
                            $("#goodsList").datagrid("reload");
                        });
                    }
                }
            });
        }
    });
}
//驳回申请
function applyrej(id){
    $.messager.confirm('确认', '确定撤回选中的申请吗？', function(r) {
        if (r) {
            $.ajax({
                url: 'apply/rej',
                data: {id: id},
                type: 'POST',
                success: function (data) {
                    if (data.status == 200) {
                        $.messager.alert('提示', '申请已驳回!', undefined, function () {
                            $("#goodsList").datagrid("reload");
                        });
                    }
                }
            });
        }
    });
}