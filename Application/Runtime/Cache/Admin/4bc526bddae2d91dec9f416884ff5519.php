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
    <div style="width: 60%;margin: auto; padding: 60px 0; ">
        <form id="form">
            <div class="adminInputGroup">
                <div class="adminInputTitle">Product name</div>
                <div class="adminInputLine"><input type="text" name="name" value="<?php echo ($info["name"]); ?>" /></div>
            </div>
            <div class="adminInputGroup">
                <div class="adminInputTitle">繁</div>
                <div class="adminInputLine"><input type="text" name="twName" value="<?php echo ($info["twName"]); ?>" /></div>
            </div>
            <div class="adminInputGroup">
                <div class="adminInputTitle">簡</div>
                <div class="adminInputLine"><input type="text" name="cnName" value="<?php echo ($info["cnName"]); ?>" /></div>
            </div>
            <div class="adminInputGroup">
                <div class="adminInputTitle">Pictures</div>
                <div class="adminInputLine" style="position: relative;height: 55px">
                    If you do not want to update photos, please do not upload any photos <br />Select photo(s):
                    <input type="file" name="photo[]" multiple />
                </div>
            </div>
            <div class="adminInputGroup" style="margin-top:30px">
                <div class="adminInputTitle">Category</div>
                <div class="adminInputLine">
                    <select class="selectinput" name="cateId" id="cateId" style="outline: none;
					border: none;
					width: 40%;
					padding: 10px 10px; border-radius: 40px ;
					filter:drop-shadow(0px 0px 6px rgba(0, 0, 0, 0.161));margin-top: 5px;background: #7c83a3;color: white ">
                        <?php if(is_array($cate_list)): $i = 0; $__LIST__ = $cate_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["cateId"]); ?>"><?php echo ($vo["name"]); ?>
                            </option><?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>
            </div>
            <div class="adminInputGroup">
                <div class="adminInputTitle">Product description</div>
                <div class="adminInputLine">
                    <textarea name="desc" class="descInput"
                        style="height: 120px;resize: none;width: 100%;color: #7c83a3"><?php echo ($info["desc"]); ?></textarea>
                </div>
            </div>
            <div class="adminInputGroup">
                <div class="adminInputTitle">Place</div>
                <div class="adminInputLine">
                    <input type="text" name="place" value="<?php echo ($info["place"]); ?>" />
                </div>
            </div>
            <div class="adminInputGroup">
                <div class="adminInputTitle">Price</div>
                <div class="adminInputLine">
                    <input type="number" name="price" value="<?php echo ($info["price"]); ?>" min="1" max="9999999" />
                </div>
            </div>
            <div class="adminInputGroup">
                <div class="adminInputTitle">Stock</div>
                <div class="adminInputLine"><input type="text" name="stock" value="<?php echo ($info["stock"]); ?>" /></div>
            </div>
            <div class="adminInputGroup">
                <div class="adminInputTitle">Time</div>
                <div class="adminInputLine"><input type="text" name="hour" value="<?php echo ($info["hour"]); ?>" /></div>
            </div>
            <div class="adminInputGroup" style="margin-top: 10px">
                <div class="adminInputTitle">Whether the shelf</div>
                <div class="adminInputLine2" style="margin-top: 7px">
                    <label>
                        <input type="radio" name="isShow" class="demoHidden" value="1" <?php if($info['isShow'] == 1): ?>checked="true"<?php endif; ?> >
                        <span class="radioInput"></span><span class="radioName">Yes</span>
                    </label>
                    <label style="margin-left: 30px">
                        <input type="radio" name="isShow" class="demoHidden" value="2" <?php if($info['isShow'] == 2): ?>checked="true"<?php endif; ?> >
                        <span class="radioInput"></span>
                        <span class="radioName">No</span>
                    </label>
                </div>
            </div>
            <div class="adminInputGroup" style="margin-top: 10px">
                <div class="adminInputTitle">Is Package</div>
                <div class="adminInputLine2" style="margin-top: 7px">
                    <label>
                        <input type="radio" name="isPackage" class="demoHidden" value="1" <?php if($info['isPackage'] == 1): ?>checked="true"<?php endif; ?> >
                        <span class="radioInput"></span><span class="radioName">Yes</span>
                    </label>
                    <label style="margin-left: 30px">
                        <input type="radio" name="isPackage" class="demoHidden" value="0" <?php if($info['isPackage'] == 0): ?>checked="true"<?php endif; ?> >
                        <span class="radioInput"></span>
                        <span class="radioName">No</span>
                    </label>
                </div>
            </div>
            <div class="adminInputGroup">
                <div class="adminInputTitle">Number of Time for Package </div>
                <div class="adminInputLine" style="position: relative;height: 55px"> If this product is not package,
                    please enter "0"
                    <input type="text" name="numberOfTimes" value="<?php echo ($info["numberOfTimes"]); ?>" />
                </div>


            </div>
            <div class="adminInputGroup" style="text-align: center;">
                <span class="saveDoBtn">save</span>
            </div>
        </form>
    </div>
</body>

</html>
<script type="text/javascript">
    $(document).ready(function () {
        var id = "<?php echo ($info["id"]); ?>";
        if (id == false) {
            var url = "<?php echo U('save');?>?do=add";
        } else {
            var url = "<?php echo U('save');?>?do=edit&id=" + id;
            $("#cateId option[value='" + "<?php echo ($info["cateId"]); ?>" + "']").attr("selected", "selected");
        }
        $('.saveDoBtn').click(function () {
            var name = $('input[name=name]').val();
            var desc = $('.descInput').val();
            desc = desc.replace(/\n/g, '<br/>');
            var price = $('input[name=price]').val();
            var stock = $('input[name=stock]').val();
            if (!name) {
                layer.msg('請輸入有效的商品名稱');
                return false;
            }
            if (!desc) {
                layer.msg('請輸入有效的描述介紹');
                return false;
            }
            //$('.descInput').val(desc);
            //
            if (!price) {
                layer.msg('請輸入有效的價格');
                return false;
            }
            if (!stock) {
                layer.msg('請輸入有效的庫存');
                return false;
            }
            layer.load(1);
            for (var pair of new FormData($('#form')[0]).entries()) {
                console.log('varName:' + pair[0] + ' ,varData:' + pair[1]);
            }
            $.ajax({
                url: url,
                type: "post",
                dataType: "json",
                data: new FormData($('#form')[0]),
                processData: false,
                contentType: false,
                success: function (data) {
                    console.log(data);

                    layer.closeAll('loading');
                    if (data.status == 111) {
                        layer.msg(data.msg);
                        setTimeout(function () {
                            parent.location.reload(); // 父頁面刷新
                            var index = parent.layer.getFrameIndex(window
                                .name); //獲取窗口索引
                            parent.layer.close(index);
                        }, 500)
                    } else {
                        layer.msg(data.msg);
                    }
                }
            })
        })
    })
</script>