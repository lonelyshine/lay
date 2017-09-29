<%@ page language="java" import="java.util.*,com.cy.ssm.beans.UserBean" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
UserBean user = (UserBean)request.getSession().getAttribute("user");
String email = user.getEmail();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title> hAdmin- 主页</title>

    <meta name="keywords" content="">
    <meta name="description" content="">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
    
    <link rel="stylesheet" href="eachOther/layui/css/layui.css">
    
    
    
    
    
    <link rel="stylesheet" href="mplayer/css/mplayer.css">
	<style>
		.info {
			font-family: "Microsoft Yahei";
			text-align: center;
		}
		.info h1 {
			font-weight: 400;
		}
	</style>
    
    
    
    
    
</head>
<input id="email" type=hidden name="email" value="<%=email%>">
<input id="basepath" type=hidden name="basepath" value="<%=basePath%>"> 
<!-- <body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden" onLoad="Polling()"> -->
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <!-- <li class="nav-header">
                        <div class="dropdown profile-element">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                    <span class="block m-t-xs" style="font-size:20px;">
                                        <i class="fa fa-area-chart"></i>
                                        <strong class="font-bold">hAdmin</strong>
                                    </span>
                                </span>
                            </a>
                        </div>
                        <div class="logo-element">hAdmin
                        </div>
                    </li> -->
                    
                    <li class="nav-header">

                        <div class="dropdown profile-element"> <span>
                            <img id="avatarimg" alt="image" class="img-circle" src="img/profile_small.jpg" />
                             </span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                                <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold"><%=user.getUserName()%></strong>
                             </span> <span class="text-muted text-xs block">超级管理员 <b class="caret"></b></span> </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a class="J_menuItem"  href="form_avatar">个人资料</a>
                                </li>
                                <!-- <li><a class="J_menuItem" href="profile">个人资料</a>
                                </li> -->
                               <!--  <li><a href="contacts.html">联系我们</a>
                                </li> -->
                                <li><a class="J_menuItem" href="mailbox">信箱</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="loginout">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">
                            H+
                        </div>

                    </li>
                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">分类</span>
                    </li> 
                    <li>
                        <a class="J_menuItem" href="index_v1.html">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">主页</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa fa-bar-chart-o"></i>
                            <span class="nav-label">统计图表</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="graph_echarts.html">百度ECharts</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="graph_flot.html">Flot</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="graph_morris.html">Morris.js</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="graph_rickshaw.html">Rickshaw</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="graph_peity.html">Peity</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="graph_sparkline.html">Sparkline</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="graph_metrics.html">图表组合</a>
                            </li>
                        </ul>
                    </li>
                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">分类</span>
                    </li>
                    
                    <li>
                        <a href=""><i class="glyphicon glyphicon-user"></i> <span class="nav-label">我的信息</span><span class="label label-warning pull-right"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="form_avatar">个人资料</a>
                            </li>
                            <li><a class="J_menuItem" href="contacts.html">联系人</a>
                            </li>
                        </ul>
                    </li>
                    
                    
                    <li>
                        <a href="mailbox.html"><i class="fa fa-envelope"></i> <span class="nav-label">信箱</span><span class="label label-warning pull-right" id="notreademail"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="mailbox">收件箱</a>
                            </li>
                            <!-- <li><a class="J_menuItem" href="mail_detail.html">查看邮件</a>
                            </li> -->
                            <li><a class="J_menuItem" href="mail_compose">写信</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href=""><i class="fa fa-file"></i> <span class="nav-label">文件管理</span><span class="label label-warning pull-right"></span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="file_manager">文件管理器</a>
                            </li>
                            <li><a class="J_menuItem" href="file_converter">文件转换器</a>
                            </li>
                            <!-- <li><a class="J_menuItem" href="mail_detail.html">查看邮件</a>
                            </li> -->
                            <!-- <li><a class="J_menuItem" href="mail_compose">写信</a>
                            </li> -->
                        </ul>
                    </li>
                    
                    
                    
                    <li>
                        <a href=""><i class="fa fa-file"></i> <span class="nav-label">编辑器</span><span class="label label-warning pull-right"></span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="jsrun">JS编辑器</a>
                            </li>
                            <li><a class="J_menuItem" href="jsrunlist">js资源库</a>
                            </li>
                        </ul>
                    </li>
                    
                  
                    <li>
                        <a href=""><i class="fa fa-file"></i> <span class="nav-label">万能搜索</span><span class="label label-warning pull-right"></span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="search/index.html">万能搜索</a>
                            </li>
                            <li><a class="J_menuItem" href="file_converter">文本编辑器</a>
                            </li>
                        </ul>
                    </li>
                  
                  
                  
                    
                    <li>
                        <a href=""><i class="glyphicon glyphicon-xbt"></i> <span class="nav-label">博客信息</span><span class="label label-warning pull-right"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="blog.html">文章列表</a>
                            </li>
                            <li><a class="J_menuItem" href="article.html">文章详情</a>
                            </li>
                        </ul>
                    </li>
                    
                    
                    <li>
                        <a href=""><i class="glyphicon glyphicon-xbt"></i> <span class="nav-label">休闲游戏</span><span class="label label-warning pull-right"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="blog.html">文章列表</a>
                            </li>
                            <li><a class="J_menuItem" href="article.html">文章详情</a>
                            </li>
                        </ul>
                    </li>
                    
                    
                    
                    
                    
                    
                    <li>
                        <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">表单</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="form_basic.html">基本表单</a>
                            </li>
                            <li><a class="J_menuItem" href="form_validate.html">表单验证</a>
                            </li>
                            <li><a class="J_menuItem" href="form_advanced.html">高级插件</a>
                            </li>
                            <li><a class="J_menuItem" href="form_wizard.html">表单向导</a>
                            </li>
                            <li>
                                <a href="#">文件上传 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="form_webuploader.html">百度WebUploader</a>
                                    </li>
                                    <li><a class="J_menuItem" href="form_file_upload.html">DropzoneJS</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">编辑器 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="form_editors.html">富文本编辑器</a>
                                    </li>
                                    <li><a class="J_menuItem" href="form_simditor.html">simditor</a>
                                    </li>
                                    <li><a class="J_menuItem" href="form_markdown.html">MarkDown编辑器</a>
                                    </li>
                                    <li><a class="J_menuItem" href="code_editor.html">代码编辑器</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="layerdate.html">日期选择器layerDate</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-desktop"></i> <span class="nav-label">页面</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="contacts.html">联系人</a>
                            </li>
                            <li><a class="J_menuItem" href="profile.html">个人资料</a>
                            </li>
                            <li>
                                <a href="#">项目管理 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="projects.html">项目</a>
                                    </li>
                                    <li><a class="J_menuItem" href="project_detail.html">项目详情</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="teams_board.html">团队管理</a>
                            </li>
                            <li><a class="J_menuItem" href="social_feed.html">信息流</a>
                            </li>
                            <li><a class="J_menuItem" href="clients.html">客户管理</a>
                            </li>
                            <li><a class="J_menuItem" href="file_manager.html">文件管理器</a>
                            </li>
                            <li><a class="J_menuItem" href="calendar.html">日历</a>
                            </li>
                            <li>
                                <a href="#">博客 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="blog.html">文章列表</a>
                                    </li>
                                    <li><a class="J_menuItem" href="article.html">文章详情</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="faq.html">FAQ</a>
                            </li>
                            <li>
                                <a href="#">时间轴 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="timeline.html">时间轴</a>
                                    </li>
                                    <li><a class="J_menuItem" href="timeline_v2.html">时间轴v2</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="pin_board.html">标签墙</a>
                            </li>
                            <li>
                                <a href="#">单据 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="invoice.html">单据</a>
                                    </li>
                                    <li><a class="J_menuItem" href="invoice_print.html">单据打印</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="search_results.html">搜索结果</a>
                            </li>
                            <li><a class="J_menuItem" href="forum_main.html">论坛</a>
                            </li>
                            <li>
                                <a href="#">即时通讯 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="chat_view.html">聊天窗口</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">登录注册相关 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a href="login.html" target="_blank">登录页面</a>
                                    </li>
                                    <li><a href="login_v2.html" target="_blank">登录页面v2</a>
                                    </li>
                                    <li><a href="register.html" target="_blank">注册页面</a>
                                    </li>
                                    <li><a href="lockscreen.html" target="_blank">登录超时</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="404.html">404页面</a>
                            </li>
                            <li><a class="J_menuItem" href="500.html">500页面</a>
                            </li>
                            <li><a class="J_menuItem" href="empty_page.html">空白页</a>
                            </li>
                        </ul>
                    </li>
                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">分类</span>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-flask"></i> <span class="nav-label">UI元素</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="typography.html">排版</a>
                            </li>
                            <li>
                                <a href="#">字体图标 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li>
                                        <a class="J_menuItem" href="fontawesome.html">Font Awesome</a>
                                    </li>
                                    <li>
                                        <a class="J_menuItem" href="glyphicons.html">Glyphicon</a>
                                    </li>
                                    <li>
                                        <a class="J_menuItem" href="iconfont.html">阿里巴巴矢量图标库</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">拖动排序 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="draggable_panels.html">拖动面板</a>
                                    </li>
                                    <li><a class="J_menuItem" href="agile_board.html">任务清单</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="buttons.html">按钮</a>
                            </li>
                            <li><a class="J_menuItem" href="tabs_panels.html">选项卡 &amp; 面板</a>
                            </li>
                            <li><a class="J_menuItem" href="notifications.html">通知 &amp; 提示</a>
                            </li>
                            <li><a class="J_menuItem" href="badges_labels.html">徽章，标签，进度条</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="grid_options.html">栅格</a>
                            </li>
                            <li><a class="J_menuItem" href="plyr.html">视频、音频</a>
                            </li>
                            <li>
                                <a href="#">弹框插件 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="layer.html">Web弹层组件layer</a>
                                    </li>
                                    <li><a class="J_menuItem" href="modal_window.html">模态窗口</a>
                                    </li>
                                    <li><a class="J_menuItem" href="sweetalert.html">SweetAlert</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">树形视图 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="jstree.html">jsTree</a>
                                    </li>
                                    <li><a class="J_menuItem" href="tree_view.html">Bootstrap Tree View</a>
                                    </li>
                                    <li><a class="J_menuItem" href="nestable_list.html">nestable</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="toastr_notifications.html">Toastr通知</a>
                            </li>
                            <li><a class="J_menuItem" href="diff.html">文本对比</a>
                            </li>
                            <li><a class="J_menuItem" href="spinners.html">加载动画</a>
                            </li>
                            <li><a class="J_menuItem" href="widgets.html">小部件</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-table"></i> <span class="nav-label">表格</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="table_basic.html">基本表格</a>
                            </li>
                            <li><a class="J_menuItem" href="table_data_tables.html">DataTables</a>
                            </li>
                            <li><a class="J_menuItem" href="table_jqgrid.html">jqGrid</a>
                            </li>
                            <li><a class="J_menuItem" href="table_foo_table.html">Foo Tables</a>
                            </li>
                            <li><a class="J_menuItem" href="table_bootstrap.html">Bootstrap Table
                                <span class="label label-danger pull-right">推荐</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">分类</span>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-picture-o"></i> <span class="nav-label">相册</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="basic_gallery.html">基本图库</a>
                            </li>
                            <li><a class="J_menuItem" href="carousel.html">图片切换</a>
                            </li>
                            <li><a class="J_menuItem" href="blueimp.html">Blueimp相册</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="J_menuItem" href="css_animation.html"><i class="fa fa-magic"></i> <span class="nav-label">CSS动画</span></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-cutlery"></i> <span class="nav-label">工具 </span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="form_builder.html">表单构建器</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-info " href="#"><i class="fa fa-bars"></i> </a>
                        <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                            <div class="form-group">
                                <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                            </div>
                        </form>
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-envelope"></i> <span class="label label-warning" id ="waringemail">16</span>
                            </a>
                            <ul class="dropdown-menu dropdown-messages">
                                <li class="m-t-xs">
                                    <div class="dropdown-messages-box">
                                        <a href="profile.html" class="pull-left">
                                            <img alt="image" class="img-circle" src="img/a7.jpg">
                                        </a>
                                        <div class="media-body">
                                            <small class="pull-right">46小时前</small>
                                            <strong>小四</strong> 是不是只有我死了,你们才不骂爵迹
                                            <br>
                                            <small class="text-muted">3天前 2014.11.8</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="dropdown-messages-box">
                                        <a href="profile.html" class="pull-left">
                                            <img alt="image" class="img-circle" src="img/a4.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right text-navy">25小时前</small>
                                            <strong>二愣子</strong> 呵呵
                                            <br>
                                            <small class="text-muted">昨天</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="mailbox">
                                            <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                            </a>
                            <ul class="dropdown-menu dropdown-alerts">
                                <li>
                                    <a href="mailbox.html">
                                        <div>
                                            <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                            <span class="pull-right text-muted small">4分钟前</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="profile.html">
                                        <div>
                                            <i class="fa fa-qq fa-fw"></i> 3条新回复
                                            <span class="pull-right text-muted small">12分钟钱</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="notifications.html">
                                            <strong>查看所有 </strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="loginout">
                                <i class="fa fa-sign-out"></i> 退出
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe id="J_iframe" width="100%" height="100%" src="index_v1.html?v=4.0" frameborder="0" data-id="index_v1.html" seamless></iframe>
            </div>
        </div>
        <!--右侧部分结束-->
    </div>





<!--歌曲开始-->
<div class="mp" style='z-index:2002'>
	<div class="mp-box" >
		<img src="mplayer/img/mplayer_error.png" alt="music cover" class="mp-cover">
		<div class="mp-info">
			<p class="mp-name">燕归巢</p>
			<p class="mp-singer">许嵩</p>
			<p><span class="mp-time-current">00:00</span>/<span class="mp-time-all">00:00</span></p>
		</div>
		<div class="mp-btn">
			<button class="mp-prev" title="上一首"></button>
			<button class="mp-pause" title="播放"></button>
			<button class="mp-next" title="下一首"></button>
			<button class="mp-mode" title="播放模式"></button>
			<div class="mp-vol">
				<button class="mp-vol-img" title="静音"></button>
				<div class="mp-vol-range" data-range_min="0" data-range_max="100" data-cur_min="80">
					<div class="mp-vol-current"></div>
					<div class="mp-vol-circle"></div>
				</div>
			</div>
		</div>
		<div class="mp-pro">
			<div class="mp-pro-current"></div>
		</div>
		<div class="mp-menu">
			<button class="mp-list-toggle"></button>
			<button class="mp-lrc-toggle"></button>
		</div>
	</div>
	<button class="mp-toggle">
		<span class="mp-toggle-img"></span>
	</button>
	<div id="lrc-sing" class="mp-lrc-box">
		<ul class="mp-lrc"></ul>
	</div>
	<button class="mp-lrc-close"></button>
	<div class="mp-list-box">
		<ul class="mp-list-title"></ul>
		<table class="mp-list-table">
			<thead>
				<tr>
					<th>歌名</th>
					<th>歌手</th>
					<th>时长</th>
				</tr>
			</thead>
			<tbody class="mp-list"></tbody>
		</table>
	</div>
</div>
<script src="mplayer/js/jquery.js"></script>
<script src="mplayer/js/jquery.js"></script>
<script src="mplayer/js/mplayer.js"></script>
<script src="mplayer/js/mplayer-list.js"></script>
<script src="mplayer/js/mplayer-functions.js"></script>
<script src="mplayer/js/jquery.nstSlider.js"></script>
<script>
var modeText = ['顺序播放','单曲循环','随机播放','列表循环'];
var player = new MPlayer({
	// 容器选择器名称
	containerSelector: '.mp',
	// 播放列表
	songList: mplayer_song,
	// 专辑图片错误时显示的图片
	defaultImg: 'img/mplayer_error.png',
	// 自动播放
	autoPlay: true,
	// 播放模式(0->顺序播放,1->单曲循环,2->随机播放,3->列表循环(默认))
	playMode:0,
	playList:0,
	playSong:0,
	// 当前歌词距离顶部的距离
	lrcTopPos: 34,
	// 列表模板，用${变量名}$插入模板变量
	listFormat: '<tr><td>${name}$</td><td>${singer}$</td><td>${time}$</td></tr>',
	// 音量滑块改变事件名称
	volSlideEventName:'change',
	// 初始音量
	defaultVolume:80
}, function () {
	// 绑定事件
	this.on('afterInit', function () {
		console.log('播放器初始化完成，正在准备播放');
	}).on('beforePlay', function () {
		var $this = this;
		var song = $this.getCurrentSong(true);
		var songName = song.name + ' - ' + song.singer;
		console.log('即将播放'+songName+'，return false;可以取消播放');
	}).on('timeUpdate', function () {
		var $this = this;
		console.log('当前歌词：' + $this.getLrc());
	}).on('end', function () {
		var $this = this;
		var song = $this.getCurrentSong(true);
		var songName = song.name + ' - ' + song.singer;
		console.log(songName+'播放完毕，return false;可以取消播放下一曲');
	}).on('mute', function () {
		var status = this.getIsMuted() ? '已静音' : '未静音';
		console.log('当前静音状态：' + status);
	}).on('changeMode', function () {
		var $this = this;
		var mode = modeText[$this.getPlayMode()];
		$this.dom.container.find('.mp-mode').attr('title',mode);
		console.log('播放模式已切换为：' + mode);
	});
});

$(document.body).append(player.audio); // 测试用

setEffects(player);


</script>
<!--歌曲结束-->


    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="js/plugins/layer/layer.min.js"></script>

    <!-- 自定义js -->
    <script src="js/hAdmin.js?v=4.1.0"></script>
    <script type="text/javascript" src="js/index.js"></script>
 
    <!-- 加载弹出层样式的相关js -->
    <script src="layer-v1.8.5/layer/layer.min.js"></script>
 
    <!-- 第三方插件 -->
    <script src="js/plugins/pace/pace.min.js"></script>
    <script src="eachOther/layui/layui.js"></script>
    
    <script src="webstocket/websocket.js"></script>
	<script  type="text/javascript">
	//头像图片相关路径设置
	if('<%=user.getAvatar()%>'==null||'<%=user.getAvatar()%>'==''){
	document.getElementById("avatarimg").src="img/profile_small.jpg";
	}else{
	document.getElementById("avatarimg").src='fileManager/'+'<%=user.getAvatar()%>';
	//document.getElementById("avatarimg").src="fileManager/2017741356733_1.JPG";
	}
	//用户名称设置
	
	
	//轮询查询邮件信息
	 /* function Polling(){  
	      getNOTRead();
   		 synchronous();  
   		 setInterval("synchronous()", 180000);  
    }  */
    //获取自己闲聊的相关信息  
    getTalkInfo();
    function synchronous(){
         var email = document.getElementById('email').value; 
		 if(email!=null&&email!=""){
		     var basepath = document.getElementById('basepath').value; 
			 var url =  basepath + "/newEmail.do"; //请求的网址  
			 var number = 1;
			 var reqParams = {'number':number};//请求数据
			 $(function(){$.ajax(
			                   {  
			                        type:"POST",  
			                        url:url,  
			                        data:reqParams,  
			                        async:true,//异步  
			                        dataType:"json",  
			                        success: function(data){  
			                            if(data.isError == false) {
			                              number = number+1;
			                              console.log(number);
			                              getNOTRead();
			                            }else{
			                              //alert("发送邮件失败");
			                              layer.msg('发送邮件失败');
			                            }
			                        }
						      });
			         });
			         
		 }
    }
    // 查询未读邮件
    function getNOTRead(){
		     var basepath = document.getElementById('basepath').value; 
			 var url =  basepath + "/EmailNotRead.do"; //请求的网址  
			 var number = 1;
			 $(function(){$.ajax(
			                   {  
			                        type:"POST",  
			                        url:url,  
			                        data:{},  
			                        async:true,//异步  
			                        dataType:"json",  
			                        success: function(data){  
			                            if(data.isError == false) {
			                              $("#notreademail").text(data.notReadEmail);
			                              $("#waringemail").text(data.notReadEmail);
			                            }else{
			                              //alert("获取未读邮件失败");
			                              layer.msg('获取未读邮件失败');
			                            }
			                        }
						      });
			         });
    }
    
    
	 /* var email = document.getElementById('email').value; 
	 if(email!=null&&email!=""){
	     var basepath = document.getElementById('basepath').value; 
		 var url =  basepath + "/newEmail.do"; //请求的网址  
		 var number = 1;
		 var reqParams = {'number':number};//请求数据
		 window.setInterval(function(){$.ajax(
		                   {  
		                        type:"POST",  
		                        url:url,  
		                        data:reqParams,  
		                        async:false,  
		                        dataType:"json",  
		                        success: function(data){  
		                            if(data.isError == false) {
		                              number = number+1;
		                              console.log(number);
		                              //alert("发送邮件成功");
		                            }else{
		                              alert("发送邮件失败");
		                            }
		                        }
					      }
		
		         )},180000);
	 }
 */	
 var mine;//个人信息
 var friend = [];//朋友信息
 var group = [];//群组信息
 
  var basepath = document.getElementById('basepath').value; //项目路径
  var getMemberpath = document.getElementById('basepath').value+"getMembers";
 
    
   //获取自己的闲聊的相关信息
    function getTalkInfo(){
             var basepath = document.getElementById('basepath').value; 
			 var url =  basepath + "getMYTalkInfo.do"; //请求的网址  
			 $(function(){$.ajax(
			                   {  
	                        type:"POST",  
	                        url:url,  
	                        data:{},  
	                        async:true,//异步  
	                        dataType:"json",  
	                        success: function(data){
	                        if(data.isError == false) {
		                        if(data!=''&&data!=null){
		                            console.log(data);
		                            //------------个人信息开始------------------------
		                            mine={ "username": (data.mine)[0].NICKNAME //我的昵称
									        ,"id": (data.mine)[0].USERID //我的ID
									        ,"status": (data.mine)[0].ONLINESTATUS //在线状态 online：在线、hide：隐身
									        ,"remark": (data.mine)[0].REMARK //我的签名
									        ,"avatar": (data.mine)[0].AVATAR //我的头像
									        }
									 //-------个人信息查询结束-------------------        
									//-----------------好友信息查询开始------------------------      
									//var friend=[];  
								    var tempfriend = data.friend;
									var groupid ="";
									var groupname;
									var id;
									var list=[]; 
									var online =0;       
									for(var i=0;i<tempfriend.length;i++){
                                        if(groupid==tempfriend[i].GROUPID){
                                              if(tempfriend[i].FSTATUS=='online'){
                                                online = online+1;
                                              }
                                              var temp = {
	                                            "username": tempfriend[i].FNICKNAME
										        ,"id": tempfriend[i].FRIDENDID
										        ,"avatar": tempfriend[i].FAVATAR
										        ,"sign": tempfriend[i].FREMARK
                                               };
                                              list.push(temp);
                                        }else{
                                        
                                            if(i!=0){
                                             var tempfriendgroup ={
                                                  "groupname": groupname
											      ,"id": groupid
											      ,"online": online
											      ,"list": list
                                             };
                                             console.log("asgdgasfd");
                                             console.log(tempfriendgroup);
                                               friend.push(tempfriendgroup);
                                               list = [];
                                            }
                                            online = 0;
                                            groupid=tempfriend[i].GROUPID;
                                            groupname=tempfriend[i].GROUPNAME;
                                            var temp = {
	                                            "username": tempfriend[i].FNICKNAME
										        ,"id": tempfriend[i].FRIDENDID
										        ,"avatar": tempfriend[i].FAVATAR
										        ,"sign": tempfriend[i].FREMARK
                                            };
                                            
                                            if(tempfriend[i].FSTATUS=='online'){
                                                online = online+1;
                                             }
                                            list.push(temp);
                                        }								
									}
									if(tempfriend.length>0){
									var tempfriendgroup ={
                                                  "groupname": groupname
											      ,"id": groupid
											      ,"online": online
											      ,"list": list
                                             };
                                             console.log("asgdgasfd");
                                             console.log(tempfriendgroup);
                                               friend.push(tempfriendgroup);
									}
									//-------------------好友信息查询结束---------------------
									//-------------------群组信息查询开始---------------------
									var tempgroup = data.group;
									for(var j=0;j<tempgroup.length;j++){
									     var tempgrouplist = {
									              "groupname": tempgroup[j].GROUPNAME
											      ,"id": tempgroup[j].GROUPID
											      ,"avatar": tempgroup[j].GAVATAR
									     };
									     group.push(tempgrouplist);
									}
									//-------------------群组信息查询结束---------------------
									
									loadlayim();//加载对话框信息
		                           }else{
		                           layer.msg('获取信息失败');
		                           }
                            }else{
                              layer.msg('获取信息失败');
                            }
	                      }
				      });
			         });
    }
 
 
 
 function loadlayim(){
 
 layui.use('layim', function(layim){
  
  //基础配置
  layim.config({
  
    //采用以下方式初始化接口
    init: {
       mine
      ,friend 
      ,group
    }
   
    //查看群员接口
       ,members: {
       url: "getMembers"
      ,data: {}
    }   
    
    //上传图片接口
    ,uploadImage: {
      url: '/upload/image' //（返回的数据格式见下文）
      ,type: '' //默认post
    } 
    
    //上传文件接口
    ,uploadFile: {
      url: '/upload/file' //（返回的数据格式见下文）
      ,type: '' //默认post
    }
    
    ,isAudio: true //开启聊天工具栏音频
    ,isVideo: true //开启聊天工具栏视频
    
    //扩展工具栏
    ,tool: [{
       alias: 'code'
      ,title: '代码'
      ,icon: '&#xe64e;'
    }]
    
    //,brief: true //是否简约模式（若开启则不显示主面板）
    
    //,title: 'WebIM' //自定义主面板最小化时的标题
    //,right: '100px' //主面板相对浏览器右侧距离
    //,minRight: '90px' //聊天面板最小化时相对浏览器右侧距离
    ,initSkin: '4.jpg' //1-5 设置初始背景
    //,skin: ['aaa.jpg'] //新增皮肤
    //,isfriend: false //是否开启好友
    //,isgroup: false //是否开启群组
    //,min: true //是否始终最小化主面板，默认false
    ,notice: true //是否开启桌面消息提醒，默认false
    //,voice: false //声音提醒，默认开启，声音文件为：default.wav
    
    ,msgbox: layui.cache.dir + 'css/modules/layim/html/msgbox.html' //消息盒子页面地址，若不开启，剔除该项即可
    ,find: layui.cache.dir + 'css/modules/layim/html/find.html' //发现页面地址，若不开启，剔除该项即可
    ,chatLog: layui.cache.dir + 'css/modules/layim/html/chatLog.html' //聊天记录页面地址，若不开启，剔除该项即可
    
  });

  //监听在线状态的切换事件
  layim.on('online', function(data){
    //alert(data);
    //修改签名并保存到数据库
    var basepath = document.getElementById('basepath').value; 
			 var url =  basepath + "/modifyonline.do"; //请求的网址  
			 $(function(){$.ajax(
			                   {  
			                        type:"POST",  
			                        url:url,  
			                        data:{online:data},  
			                        async:true,//异步  
			                        dataType:"json",  
			                        success: function(data){  
			                            if(data.isError == false) {
			                              layer.msg('修改签名成功');
			                            }else{
			                              //alert("获取未读邮件失败");
			                              layer.msg('修改签名失败');
			                            }
			                        }
						      });
			         });
  });
  
  //监听签名修改
  layim.on('sign', function(value){
    //alert(value);
    //修改签名并保存到数据库
    var basepath = document.getElementById('basepath').value; 
			 var url =  basepath + "/modifySign.do"; //请求的网址  
			 $(function(){$.ajax(
			                   {  
			                        type:"POST",  
			                        url:url,  
			                        data:{sign:value},  
			                        async:true,//异步  
			                        dataType:"json",  
			                        success: function(data){  
			                            if(data.isError == false) {
			                              layer.msg('修改签名成功');
			                            }else{
			                              //alert("获取未读邮件失败");
			                              layer.msg('修改签名失败');
			                            }
			                        }
						      });
			         });
  });
  //监听自定义工具栏点击，以添加代码为例
  layim.on('tool(code)', function(insert){
    layer.prompt({
      title: '插入代码'
      ,formType: 2
      ,shade: 0
    }, function(text, index){
      layer.close(index);
      insert('[pre class=layui-code]' + text + '[/pre]'); //将内容插入到编辑器
    });
  });
  
  
   //监听layim建立就绪
    //console.log(res.mine);
    layim.msgbox(5); //模拟消息盒子有新消息，实际使用时，一般是动态获得
  
  /*    //添加好友（如果检测到该socket）
    layim.addList({
      type: 'group'
      ,avatar: "http://tva3.sinaimg.cn/crop.64.106.361.361.50/7181dbb3jw8evfbtem8edj20ci0dpq3a.jpg"
      ,groupname: 'Angular开发'
      ,id: "12333333"
      ,members: 0
    });
    
    layim.addList({
       type: 'friend'
      ,avatar: "http://tp2.sinaimg.cn/2386568184/180/40050524279/0"
      ,username: '冲田杏梨'
      ,groupid: 1
      ,id: "1233333312121212"
      ,remark: "本人冲田杏梨将结束AV女优的工作"
    }); */
    
    
    
    
  /* layim.setFriendGroup({
  type: 'friend'
  ,username: 'xxx' //好友昵称，若申请加群，参数为：groupname
  ,avatar: 'a.jpg' //头像
  ,group: layim.cache().friend //获取好友列表数据
  ,submit: function(group, index){
    //一般在此执行Ajax和WS，以通知对方已经同意申请
    //……
    
    //同意后，将好友追加到主面板
    layim.addList(data); //见下文
  }
}); */
  
  
  
  
/*   //监听layim建立就绪
  layim.on('ready', function(res){

    //console.log(res.mine);
    
    layim.msgbox(5); //模拟消息盒子有新消息，实际使用时，一般是动态获得
  
    //添加好友（如果检测到该socket）
    layim.addList({
      type: 'group'
      ,avatar: "http://tva3.sinaimg.cn/crop.64.106.361.361.50/7181dbb3jw8evfbtem8edj20ci0dpq3a.jpg"
      ,groupname: 'Angular开发'
      ,id: "12333333"
      ,members: 0
    });
    layim.addList({
      type: 'friend'
      ,avatar: "http://tp2.sinaimg.cn/2386568184/180/40050524279/0"
      ,username: '冲田杏梨'
      ,groupid: 2
      ,id: "1233333312121212"
      ,remark: "本人冲田杏梨将结束AV女优的工作"
    });
    
    setTimeout(function(){
      //接受消息（如果检测到该socket）
      layim.getMessage({
        username: "Hi"
        ,avatar: "http://qzapp.qlogo.cn/qzapp/100280987/56ADC83E78CEC046F8DF2C5D0DD63CDE/100"
        ,id: "10000111"
        ,type: "friend"
        ,content: "临时："+ new Date().getTime()
      });
      
      /*layim.getMessage({
        username: "贤心"
        ,avatar: "http://tp1.sinaimg.cn/1571889140/180/40030060651/1"
        ,id: "100001"
        ,type: "friend"
        ,content: "嗨，你好！欢迎体验LayIM。演示标记："+ new Date().getTime()
      });*/
  /*    
    }, 3000);
  });
 */
   //监听发送消息
  layim.on('sendMessage', function(data){
    var To = data.to;
    console.log(data);
     send(data);
  }); 
  
   
   //监听接收消息
  layim.on('getMessage', function(data){
		  layim.getMessage({
		  username: "纸飞机" //消息来源用户名
		  ,avatar: "http://tp1.sinaimg.cn/1571889140/180/40030060651/1" //消息来源用户头像
		  ,id: "100000" //消息的来源ID（如果是私聊，则是用户id，如果是群聊，则是群组id）
		  ,type: "friend" //聊天窗口来源类型，从发送消息传递的to里面获取
		  ,content: "嗨，你好！本消息系离线消息。" //消息内容
		  ,cid: 0 //消息id，可不传。除非你要对消息进行一些操作（如撤回）
		  ,mine: false //是否我发送的消息，如果为true，则会显示在右方
		  ,fromid: "100000" //消息的发送者id（比如群组中的某个消息发送者），可用于自动解决浏览器多窗口时的一些问题
		  ,timestamp: 1467475443306 //服务端动态时间戳
          });
  }); 

  //监听查看群员
  layim.on('members', function(data){
    console.log(data);
  });
  
  //监听聊天窗口的切换
  layim.on('chatChange', function(res){
    var type = res.data.type;
    console.log(res.data.id)
    if(type === 'friend'){
      //模拟标注好友状态
      //layim.setChatStatus('<span style="color:#FF5722;">在线</span>');
    } else if(type === 'group'){
      //模拟系统消息
      layim.getMessage({
        system: true
        ,id: res.data.id
        ,type: "group"
        ,content: '模拟群员'+(Math.random()*100|0) + '加入群聊'
      });
    }
  });
  
  
  
  
/*   //面板外的操作
  var $ = layui.jquery, active = {
    chat: function(){
      //自定义会话
      layim.chat({
        name: '小闲'
        ,type: 'friend'
        ,avatar: '//tva3.sinaimg.cn/crop.0.0.180.180.180/7f5f6861jw1e8qgp5bmzyj2050050aa8.jpg'
        ,id: 1008612
      });
      layer.msg('也就是说，此人可以不在好友面板里');
    }
    ,message: function(){
      //制造好友消息
      layim.getMessage({
        username: "贤心"
        ,avatar: "//tp1.sinaimg.cn/1571889140/180/40030060651/1"
        ,id: "100001"
        ,type: "friend"
        ,content: "嗨，你好！欢迎体验LayIM。演示标记："+ new Date().getTime()
        ,timestamp: new Date().getTime()
      });
    }
    ,messageAudio: function(){
      //接受音频消息
      layim.getMessage({
        username: "林心如"
        ,avatar: "//tp3.sinaimg.cn/1223762662/180/5741707953/0"
        ,id: "76543"
        ,type: "friend"
        ,content: "audio[http://gddx.sc.chinaz.com/Files/DownLoad/sound1/201510/6473.mp3]"
        ,timestamp: new Date().getTime()
      });
    }
    ,messageVideo: function(){
      //接受视频消息
      layim.getMessage({
        username: "林心如"
        ,avatar: "//tp3.sinaimg.cn/1223762662/180/5741707953/0"
        ,id: "76543"
        ,type: "friend"
        ,content: "video[http://www.w3school.com.cn//i/movie.ogg]"
        ,timestamp: new Date().getTime()
      });
    }
    ,messageTemp: function(){
      //接受临时会话消息
      layim.getMessage({
        username: "小酱"
        ,avatar: "//tva1.sinaimg.cn/crop.7.0.736.736.50/bd986d61jw8f5x8bqtp00j20ku0kgabx.jpg"
        ,id: "198909151014"
        ,type: "friend"
        ,content: "临时："+ new Date().getTime()
      });
    }
    ,add: function(){
      //实际使用时数据由动态获得
      layim.add({
        type: 'friend'
        ,username: '麻花疼'
        ,avatar: '//tva1.sinaimg.cn/crop.0.0.720.720.180/005JKVuPjw8ers4osyzhaj30k00k075e.jpg'
        ,submit: function(group, remark, index){
          layer.msg('好友申请已发送，请等待对方确认', {
            icon: 1
            ,shade: 0.5
          }, function(){
            layer.close(index);
          });
          
          //通知对方
         
          $.post('/im-applyFriend/', {
            uid: info.uid
            ,from_group: group
            ,remark: remark
          }, function(res){
            if(res.status != 0){
              return layer.msg(res.msg);
            }
            layer.msg('好友申请已发送，请等待对方确认', {
              icon: 1
              ,shade: 0.5
            }, function(){
              layer.close(index);
            });
          });
         
        }
      });
    }
    ,addqun: function(){
      layim.add({
        type: 'group'
        ,username: 'LayIM会员群'
        ,avatar: '//tva2.sinaimg.cn/crop.0.0.180.180.50/6ddfa27bjw1e8qgp5bmzyj2050050aa8.jpg'
        ,submit: function(group, remark, index){
          layer.msg('申请已发送，请等待管理员确认', {
            icon: 1
            ,shade: 0.5
          }, function(){
            layer.close(index);
          });
          
          //通知对方
          
          $.post('/im-applyGroup/', {
            uid: info.uid
            ,from_group: group
            ,remark: remark
          }, function(res){
          
          });
          
        }
      });
    }
    ,addFriend: function(){
      var user = {
        type: 'friend'
        ,id: 1234560
        ,username: '李彦宏' //好友昵称，若申请加群，参数为：groupname
        ,avatar: '//tva4.sinaimg.cn/crop.0.0.996.996.180/8b2b4e23jw8f14vkwwrmjj20ro0rpjsq.jpg' //头像
        ,sign: '全球最大的中文搜索引擎'
      }
      layim.setFriendGroup({
        type: user.type
        ,username: user.username
        ,avatar: user.avatar
        ,group: layim.cache().friend //获取好友列表数据
        ,submit: function(group, index){
          //一般在此执行Ajax和WS，以通知对方已经同意申请
          //……
          
          //同意后，将好友追加到主面板
          layim.addList({
            type: user.type
            ,username: user.username
            ,avatar: user.avatar
            ,groupid: group //所在的分组id
            ,id: user.id //好友ID
            ,sign: user.sign //好友签名
          });
          
          layer.close(index);
        }
      });
    }
    ,addGroup: function(){
      layer.msg('已成功把[Angular开发]添加到群组里', {
        icon: 1
      });
      //增加一个群组
      layim.addList({
        type: 'group'
        ,avatar: "//tva3.sinaimg.cn/crop.64.106.361.361.50/7181dbb3jw8evfbtem8edj20ci0dpq3a.jpg"
        ,groupname: 'Angular开发'
        ,id: "12333333"
        ,members: 0
      });
    }
    ,removeFriend: function(){
      layer.msg('已成功删除[凤姐]', {
        icon: 1
      });
      //删除一个好友
      layim.removeList({
        id: 121286
        ,type: 'friend'
      });
    }
    ,removeGroup: function(){
      layer.msg('已成功删除[前端群]', {
        icon: 1
      });
      //删除一个群组
      layim.removeList({
        id: 101
        ,type: 'group'
      });
    }
    //置灰离线好友
    ,setGray: function(){
      layim.setFriendStatus(168168, 'offline');
      
      layer.msg('已成功将好友[马小云]置灰', {
        icon: 1
      });
    }
    //取消好友置灰
    ,unGray: function(){
      layim.setFriendStatus(168168, 'online');
      
      layer.msg('成功取消好友[马小云]置灰状态', {
        icon: 1
      });
    }
    //移动端版本
    ,mobile: function(){
      var device = layui.device();
      var mobileHome = '/layim/demo/mobile.html';
      if(device.android || device.ios){
        return location.href = mobileHome;
      }
      var index = layer.open({
        type: 2
        ,title: '移动版演示 （或手机扫右侧二维码预览）'
        ,content: mobileHome
        ,area: ['375px', '667px']
        ,shadeClose: true
        ,shade: 0.8
        ,end: function(){
          layer.close(index + 2);
        }
      });
      layer.photos({
        photos: {
          "data": [{
            "src": "http://cdn.layui.com/upload/2016_12/168_1481056358469_50288.png",
          }]
        }
        ,anim: 0
        ,shade: false
        ,success: function(layero){
          layero.css('margin-left', '350px');
        }
      });
    }
  }; */
 /*  $('.site-demo-layim').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  }); */
  addclick();
});

 }
 
 
 var tempthis;
 
 function addclick(){
      //debugger;
        var layimMain = $('.layui-layim-main');
        //好友右键菜单
        layimMain.find('.layim-list-friend').on('contextmenu', '.layui-layim-list li', function (e) {
            //debugger;
            var othis = $(this);
            tempthis = othis;
            var id = othis[0].id;
            var html = '<ul id="contextmenu_' + othis[0].id + '" data-id="' + othis[0].id + '" data-index="' + othis.data('index') + '">';
            html += '<li layim-event="menu_chat"><i class="layui-icon" >&#xe611;</i></i>发送即时消息</li>';
            html += '<li layim-event="menu_profile"><i class="layui-icon">&#xe60a;</i></i>查看资料</li>';
            html += '<li layim-event="menu_history"><i class="layui-icon" >&#xe60e;</i></i>消息记录</li>';
            html += '<li layim-event="menu_nomsg">屏蔽消息</li>';
            html += '<li layim-event="menu_delete">删除好友</li>';
            html += '<li layim-event="menu_moveto">移动至</li></ul>';
            if (othis.hasClass('layim-null')) return;
            var index = layer.tips(html,othis,{
            tips:3
           ,time:0
           ,shift:5
           ,offset:'lb'
           ,fix:true
           ,skin:'layui-box layui-layim-contextmenu-my'
           ,success :function(layero){
						onMYblur();
						singup();
              }
           });
        });
 }
 
 
 function singup(){
         //注册邮件菜单中的方法
          $('body').on('click', '*[layim-event]', function(e){
          debugger;
            var othis = $(this), methid = othis.attr('layim-event');
            //events[methid] ? events[methid].call(this, othis, e) : '';
            if(methid=="menu_chat"){
             console.log(tempthis);
             
              //events.chat(othis);
                         
           /*  var hh = tempthis.layim-event();
            var hhh = tempthis.chat();
                 tempthis.events.chat(tempthis);
                 layer.closeAll('tips'); */
            }else if(methid=="menu_profile"){
                  layer.alert("发送即时消息");
                 layer.closeAll('tips');
            }else if(methid=="menu_history"){
                  layer.alert("发送即时消息");
                 layer.closeAll('tips');
            }else if(methid=="menu_nomsg"){
                  layer.alert("发送即时消息");
                 layer.closeAll('tips');
            }else if(methid=="menu_delete"){
                  layer.alert("发送即时消息");
                 layer.closeAll('tips');
            }else if(methid=="menu_moveto"){
                  layer.alert("发送即时消息");
                 layer.closeAll('tips');
            }
        });
 }
 
 
 //加载绑定事件，当鼠标左键点击屏幕的其他地方时关闭邮件菜单
 function onMYblur(){
       var layimMain = $('.layui-layim-main');
        //
       /*  layimMain.find('.layim-list-friend').on('click', '.layui-layim-list li', function (e) {
            layer.closeAll('tips'); //关闭所有的tips层      
        }); */
        
        layimMain.on('click',function (e) {
            layer.closeAll('tips'); //关闭所有的tips层      
        });
     }
     
     
     
     
     
     
     
     
     
     
     
    
     
     
     
     
 
	</script>
</body>

</html>
