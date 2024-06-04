<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en" class="js cssanimations">

<head>
    <link rel="icon" href="/beautyappdemo/Public/image/favicon.ico" type="image/png" sizes="16x16">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin &amp; Security Setting</title>
    <link rel="stylesheet" href="/beautyappdemo/Public/css/amazeui.css">
    <link rel="stylesheet" href="/beautyappdemo/Public/css/adminPage.css">
    <link rel="stylesheet" href="/beautyappdemo/Public/css/iconfont.css">
    <link rel="stylesheet" href="/beautyappdemo/Public/css/layui.css">
    <link href="/beautyappdemo/Public/css/adminVueindex.css" type="text/css" rel="stylesheet" />

    <script src="/beautyappdemo/Public/js/jquery.min.js"></script>
    <script src="/beautyappdemo/Public/js/layer.js"></script>
    <script src="/beautyappdemo/Public/js/vue.js?v=1.0"></script>
    <script src="/beautyappdemo/Public/js/common.js"></script>
    <script type="text/javascript" src="/beautyappdemo/Public/js/element-ui.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<script>
    function layer_show(title, url, w, h) {

        layer.open({
            type: 2,
            //area: [w + "px", h + "px"],
            area: ["80%", "90%"],

            fixed: false, //不固定
            maxmin: false,
            content: url,
            title: title
        });
    }

    $(function() {
        var noimgPath = $('#id_img').attr('src');
        if (!noimgPath) {
            $('#id_img').attr('src', "/beautyappdemo/Public/image/addPic.png");
        }

        $('#id_myfile').change(function() {
            // 先获取用户上传的文件对象
            let fileObj = this.files[0];
            // 生成一个文件读取的内置对象
            let fileReader = new FileReader();
            // 将文件对象传递给内置对象
            fileReader.readAsDataURL(fileObj); //这是一个异步执行的过程，所以需要onload回调函数执行读取数据后的操作
            // 将读取出文件对象替换到img标签
            fileReader.onload = function() { // 等待文件阅读器读取完毕再渲染图片
                $('#id_img').attr('src', fileReader.result)
            }

        })

        $('#id_myfile2').change(function() {
            // 先获取用户上传的文件对象
            let fileObj = this.files[0];
            // 生成一个文件读取的内置对象
            let fileReader = new FileReader();
            // 将文件对象传递给内置对象
            fileReader.readAsDataURL(fileObj); //这是一个异步执行的过程，所以需要onload回调函数执行读取数据后的操作
            // 将读取出文件对象替换到img标签
            fileReader.onload = function() { // 等待文件阅读器读取完毕再渲染图片
                $('#video').attr('src', fileReader.result)
            }

        })
    })
</script>

<body>
    <!--  -->
    <!-- mainbox_ban -->
    <div class="mianbox_ban" id="app" v-cloak style="">
        <div class="mainbox_content">
            <div class="tableTit">
                <div class="d-flex align-items-end justify-content-end justify-content-around ">
                    <span class="listTitle">Customers</span>
                    <div>
                        <input type="text" class="serachInput w-100" placeholder="Search" name="name" v-model='search_name' />
                        <i class="iconfont icon-search" @click="search"></i>
                    </div>
                    <div class="d-flex justify-content-end w-35 ">
                        <span @click="addshow('Create Customers','<?php echo U('addshow');?>',1000,620 )" class="adminDoBtn" style="float: right;">Create Customers</span>
                        <span class="adminDoBtn" style="float: right; " @click="outData">Export</span>
                    </div>
                </div>
            </div>
            <section>
                <div class="">
                    <table class="am-table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Sex</th>
                                <th>Email</th>
                                <th>Registration Date</th>
                                <th>Manage</th>
                            </tr>
                        </thead>
                        <tbody id="tabledatas">
                            <tr v-for="(item,index)  of  list">
                                <td>{{item.name}}</td>
                                <td>{{item.tel}}</td>
                                <td> <span v-if="item.sex==1">男</span> <span v-else>女</span> </td>
                                <td>{{item.email}}</td>
                                <td>{{item.regDate}}</td>
                                <td><button type="button" class="am-btn am-round amtable_btn" @click="addshow('Edit','<?php echo U('addshow');?>?id='+item.uid,1000,700)">Edit</button><button type="button" class="am-btn am-round amtable_delbtn" @click=del(item.uid,index)>delete</button></td>
                            </tr>
                            <tr>
                                <td colspan="13">
                                    <el-pagination background layout="prev, pager, next" :total="total" :page-size="page_size" @current-change="change_page">
                                    </el-pagination>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="am-modal am-modal-no-btn" tabindex="-1" id="doc-modal-1">
                    <div class="am-modal-dialog">
                        <div class="am-modal-hd">Email
                        </div>
                        <div class="am-modal-bd">
                            <div class="amodal_inputbox">
                                <div class="input_box" style="margin-bottom: 15px;">
                                    <input type="text" style="width: 100%; text-align: center;" id="addEmailVal">
                                </div>
                                <span class="amodal_text">Please enter the stalf member's email to create an account where he</span>
                                <span class="amodal_text">she will be granted access to manage your store.</span>
                                <div class="amodal_btnbox">
                                    <button type="button" class="am-btn am-round ammodal_btn ammodal_cancel_btn am-close-spin" data-am-modal-close="">Cancel</button>
                                    <button type="button" class="am-btn am-round ammodal_btn ammodal_add_btn" onclick="addEmailclick()">Add</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <!-- mainbox_ban end -->
</body>

</html>
<script type="text/javascript">
    new Vue({
        el: '#app',
        data: {
            total: 0, // 記錄總條數
            list: [],
            page_size: 15,
            search_name: '',
            typeList: [],
            tagsMoren: "選擇標簽",
        },
        created: function() {
            this.pageLoad(1);
        },
        methods: {
            pageLoad: function(page, name) {
                name = this.search_name;
                if (name == undefined) {
                    name = '';
                }
                var that = this;
                $.ajax({
                    url: "<?php echo U('index_data');?>?pagesize=" + this.page_size + "&page=" + page + "&name=" + name,
                    dataType: "json",
                    type: "get",
                    success: function(res) {
                        that.list = res.data
                        that.total = res.count;
                    }
                })
            },
            edit: function(title, url, w, h) {
                layer_show(title, url, w, h);
            },
            del: function(id, xh) {
                var that = this;
                layer.confirm(' Are you sure you want to delete? ', function(index) {
                    $.ajax({
                        type: 'get',
                        url: '<?php echo U("del");?>?id=' + id,
                        dataType: 'json',
                        success: function(data) {
                            layer.msg(data.msg);
                            if (data.status == 111) {
                                that.list.splice(xh, 1);
                            }
                        },
                    });
                });
            },
            addshow: function(title, url, w, h) {
                layer_show(title, url, w, h);
            },
            change_page: function(val) {
                this.pageLoad(val)
            },
            search: function() {
                this.pageLoad(1, this.search_name);
            },
            outData: function() {
                layer.msg('exporting...');
                location.href = "<?php echo U('excel/outUser');?>";
            },
            changeSelect: function(e, uid) {
                var dataType = type = e.target.value;
                if (dataType == '選擇標簽') {
                    return false;
                }
                console.log(dataType, uid);
                var that = this;
                $.ajax({
                    url: "<?php echo U('setTags');?>",
                    dataType: "json",
                    type: "post",
                    data: {
                        uid: uid,
                        name: dataType
                    },
                    success: function(res) {
                        layer.msg(res.msg);
                        that.pageLoad(1);
                    }
                })
            },
            tagsChangeSelect(e) {
                layer.load(1);
                var that = this;
                console.log(e.target.value)
                var dataType = type = e.target.value;
                if (dataType == '選擇標簽') {
                    return false;
                }
                var id_arr = [];
                var arr = $('input[name=id]');
                for (i = 0; i < arr.length; i++) {
                    if (arr[i].checked) {
                        id_arr.push(arr[i].value);
                    }
                }
                var id_str = id_arr.join(',');
                if (id_str == false) {
                    layer.msg('請選擇用護');
                    return false;
                }
                $.ajax({
                    url: "<?php echo U('piliangSetTags');?>",
                    dataType: "json",
                    type: "post",
                    data: {
                        id: id_str,
                        name: dataType
                    },
                    success: function(res) {
                        layer.closeAll('loading');
                        layer.msg(res.msg);
                        that.pageLoad(1);
                    }
                })
            },
        }
    })
    $('#delall').click(function() {
        var id_arr = [];
        var arr = $('input[name=id]');
        for (i = 0; i < arr.length; i++) {
            if (arr[i].checked) {
                id_arr.push(arr[i].value);
            }
        }
        var id_str = id_arr.join(',');
        if (id_str == false) {
            layer.msg('請選擇要刪除的項');
            return false;
        }
        layer.confirm('確認要刪除嗎？',
            function(index) {
                $.ajax({
                    url: "<?php echo U('del');?>" + "?id=" + id_str,
                    type: "get",
                    dataType: "json",
                    success: function(res) {
                        layer.msg(res.msg);
                        if (res.status == 111) {
                            setTimeout(function() {
                                    location.reload();
                                },
                                900);
                        }
                    }
                })
            })
    })
    $("#checkall").click(function() {
        $('[name=id]:checkbox').attr('checked', this.checked); //checked為true時為默認顯示的狀態  
    });
    $("#checkrev").click(function() {
        //實現反選功能 
        $('[name=id]:checkbox').each(function() {
            this.checked = !this.checked;
        });
    });
</script>