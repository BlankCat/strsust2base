<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>menu</title>
<link rel="stylesheet" href="skin/css/base.css" type="text/css" />
<link rel="stylesheet" href="skin/css/menu.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script language='javascript'>
	var curopenItem = '1';
</script>
<script language="javascript" type="text/javascript"
	src="skin/js/frame/menu.js"></script>
<base target="main" />
</head>
<body target="main">
	<table width='99%' height="100%" border='0' cellspacing='0'
		cellpadding='0'>
		<tr>
			<td style='padding-left:3px;padding-top:8px' valign="top">
				<!-- Item 2 Strat -->
				<dl class='bitem'>
					<dt onClick='showHide("items1_1")'>
						<b>商城管理</b>
					</dt>
					<dd style='display:block' class='sitem' id='items1_1'>
						<ul class='sitemu'>
							<li>
								<div class='items'>
									<div class='fllct'>
										<a href='<%=basePath%>admin/DjshCat/list1.do' target='main'>合同目录</a>
									</div>
								</div>
							</li>
						</ul>
					</dd>
				</dl>
				<dl class='bitem'>
					<dt onClick='showHide("items2_1")'>
						<b>商品管理</b>
					</dt>
					<dd style='display:block' class='sitem' id='items2_1'>
						<ul class='sitemu'>
							<li>
								<div class='items'>
									<div class='fllct'>
										<a href='<%=basePath%>admin/DjshGoods/create.do' target='main'>新增商品</a>
									</div>
								</div>
							</li>
							<li>
								<div class='items'>
									<div class='fllct'>
										<a href='<%=basePath%>admin/DjshGoods/list.do' target='main'>商品列表</a>
									</div>
								</div>
							</li>
							<li>
                <div class='items'>
                  <div class='fllct'>
                    <a href='<%=basePath%>admin/DjshGoods/list.do?checkState=0&' target='main'>未审核商品列表</a>
                  </div>
                </div>
              </li>
              <li>
                <div class='items'>
                  <div class='fllct'>
                    <a href='<%=basePath%>admin/DjshGoods/list.do?checkState=2&' target='main'>审核未通过商品列表</a>
                  </div>
                </div>
              </li>
						</ul>
					</dd>
				</dl>
				
				<dl class='bitem'>
          <dt onClick='showHide("items3_1")'>
            <b>VIP管理</b>
          </dt>
          <dd style='display:block' class='sitem' id='items3_1'>
            <ul class='sitemu'>
              <li>
                <div class='items'>
                  <div class='fllct'>
                    <a href='<%=basePath%>admin/DjshVip/list.do' target='main'>VIP列表</a>
                  </div>
                </div>
              </li>
            </ul>
          </dd>
        </dl>
				
				<%-- <dl class='bitem'>
          <dt onClick='showHide("items3_1")'>
            <b>用户上传合同管理</b>
          </dt>
          <dd style='display:block' class='sitem' id='items2_1'>
            <ul class='sitemu'>
              <li>
                <div class='items'>
                  <div class='fllct'>
                    <a href='<%=basePath%>admin/DjshUserGoods/list.do' target='main'>用户上传合同审核</a>
                  </div>
                </div>
              </li>
            </ul>
          </dd>
        </dl> --%>
				
				 <dl class='bitem'>
			          <dt onClick='showHide("items4_1")'>
			            <b>店铺管理</b>
			          </dt>
			          <dd style='display:block' class='sitem' id='items4_1'>
			            <ul class='sitemu'>
			              <li>
			                <div class='items'>
			                  <div class='fllct'>
			                    <a href='<%=basePath%>admin/DjshStore/list.do' target='main'>店铺列表</a>
			                  </div>
			                </div>
			              </li>
			              <li>
			                <div class='items'>
			                  <div class='fllct'>
			                    <a href='<%=basePath%>admin/DjshStore/create.do' target='main'>新增店铺</a>
			                  </div>
			                </div>
			               </li>
			            </ul>
			          </dd>
       			</dl> 
       			
       	<dl class='bitem'>
                <dt onClick='showHide("items5_1")'>
                  <b>Banner管理</b>
                </dt>
                <dd style='display:block' class='sitem' id='items5_1'>
                  <ul class='sitemu'>
                    <li>
                        <div class='items'>
                           <div class='fllct'>
                               <a href='<%=basePath%>admin/DjshBannerType/list.do' target='main'>Banner类别管理</a>
                           </div>
                        </div>
                   </li>
                   <li>
                     <div class='items'>
                       <div class='fllct'>
                          <a href='<%=basePath%>admin/DjshBanner/bannerJumpList.do' target='main'>Banner跳转表管理</a>
                       </div>
                     </div>
                    </li>
                  </ul>
                </dd>
            </dl> 
            
         <dl class='bitem'>
                <dt onClick='showHide("items6_1")'>
                  <b>商品活动管理</b>
                </dt>
                <dd style='display:block' class='sitem' id='items6_1'>
                  <ul class='sitemu'>
                    <li>
                      <div class='items'>
                          <div class='fllct'>
                              <a href='<%=basePath%>admin/DjshActivity/list.do' target='main'>商品活动</a>
                          </div>
                      </div>
                    </li>
                  </ul>
                </dd>
            </dl> 
            
          <dl class='bitem'>
                <dt onClick='showHide("items7_1")'>
                  <b>评论管理</b>
                </dt>
                <dd style='display:block' class='sitem' id='items7_1'>
                  <ul class='sitemu'>               
                   <li>
                     <div class='items'>
                        <div class='fllct'>
                            <a href='<%=basePath%>admin/DjshComments/list.do' target='main'>审核管理</a>
                        </div>
                     </div>
                   </li>
                  </ul>
                </dd>
            </dl>  
            
          <dl class='bitem'>
               <dt onClick='showHide("items8_1")'>
                 <b>关键字管理</b>
               </dt>
               <dd style='display:block' class='sitem' id='items8_1'>
                  <ul class='sitemu'>               
                    <li>
                     <div class='items'>
                       <div class='fllct'>
                          <a href='<%=basePath%>admin/DjshKeyword/list.do' target='main'>关键字管理</a>
                       </div>
                     </div>
                    </li>
                  </ul>
               </dd>
          </dl>
          <dl class='bitem'>
               <dt onClick='showHide("items9_1")'>
                 <b>订单管理</b>
               </dt>
               <dd style='display:block' class='sitem' id='items9_1'>
                  <ul class='sitemu'>               
                    <li>
                     <div class='items'>
                       <div class='fllct'>
                          <a href='<%=basePath%>admin/DjshOrder/yearList.do' target='main'>订单销售</a>
                       </div>
                     </div>
                    </li>
                    <li>
                     <div class='items'>
                       <div class='fllct'>
                          <a href='<%=basePath%>admin/DjshOrder/list.do' target='main'>订单查询</a>
                       </div>
                     </div>
                    </li>
                   <%--  <li>
                     <div class='items'>
                       <div class='fllct'>
                          <a href='<%=basePath%>admin/DjshOrder/isInvoiceOrderList.do' target='main'>需要发票订单列表</a>
                       </div>
                     </div>
                    </li> --%>
                  </ul>
               </dd>
          </dl> 
           <dl class='bitem'>
               <dt onClick='showHide("items10_1")'>
                 <b>销售排行</b>
               </dt>
               <dd style='display:block' class='sitem' id='items10_1'>
                  <ul class='sitemu'>               
                    <li>
                     <div class='items'>
                       <div class='fllct'>
                          <a href='<%=basePath%>admin/DjshOrderItems/djRankList.do' target='main'>点睛合同销售排行</a>
                       </div>
                     </div>
                    </li>
                    <li>
                     <div class='items'>
                       <div class='fllct'>
                          <a href='<%=basePath%>admin/DjshOrderItems/djSortRankList.do' target='main'>点睛合同分类销售排行</a>
                       </div>
                     </div>
                    </li>
                     <li>
                     <div class='items'>
                       <div class='fllct'>
                          <a href='<%=basePath%>admin/DjshOrder/storeRankList.do' target='main'>专柜销售排行</a>
                       </div>
                     </div>
                    </li>
                  </ul>
               </dd>
          </dl>
          
           <dl class='bitem'>
               <dt onClick='showHide("items11_1")'>
                 <b>发票管理</b>
               </dt>
               <dd style='display:block' class='sitem' id='items11_1'>
                  <ul class='sitemu'>               
                    <li>
                     <div class='items'>
                       <div class='fllct'>
                          <a href='<%=basePath%>admin/DjshInvoiceInfo/list.do' target='main'>发票列表</a>
                       </div>
                     </div>
                    </li>
                  </ul>
               </dd>
          </dl>
          
           <dl class='bitem'>
               <dt onClick='showHide("items12_1")'>
                 <b>管理</b>
               </dt>
               <dd style='display:block' class='sitem' id='items12_1'>
                  <ul class='sitemu'>               
                    <li>
                     <div class='items'>
                       <div class='fllct'>
                          <a href='<%=basePath%>admin/DjshTransaction/list.do' target='main'>交易单列表</a>
                       </div>
                     </div>
                    </li>
                     <li>
                     <div class='items'>
                       <div class='fllct'>
                          <a href='<%=basePath%>admin/DjshDivide/list.do' target='main'>分成列表</a>
                       </div>
                     </div>
                    </li>
                     <li>
                     <div class='items'>
                       <div class='fllct'>
                          <a href='<%=basePath%>admin/DjshApply/list.do' target='main'>提现申请列表</a>
                       </div>
                     </div>
                    </li>
                     <li>
                     <div class='items'>
                       <div class='fllct'>
                          <a href='<%=basePath%>admin/DjshRecord/list.do' target='main'>操作记录</a>
                       </div>
                     </div>
                    </li>
                     <li>
                     <div class='items'>
                       <div class='fllct'>
                          <a href='<%=basePath%>admin/DjshMessageType/list.do' target='main'>消息类型</a>
                       </div>
                     </div>
                    </li>
                  </ul>
               </dd>
          </dl>
          
             
       			<!-- Item 3 End --></td>
		</tr>
	</table>
</body>
</html>