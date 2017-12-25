package com.zfwlxt.vod.action;

import javacommon.base.BaseStruts2Action;
 
public class DjTopAction extends BaseStruts2Action{
	
	private static final long serialVersionUID = 1L;
	// 请求转发路径 forward
	protected static final String ADMIN_TOP = "/admin/top.jsp";
	protected static final String SOCIETY_TOP = "/society/top.jsp";
	protected static final String MEMBER_TOP = "/member/styles/inc/top.jsp";

//	private DjUserManager djUserManager;
//	private DjMemorgManager djMemorgManager;
//	private DjUserroleManager djUserroleManager;
//	private CasOrgManager casOrgManager;
//	public CasOrgManager getCasOrgManager() {
//		return casOrgManager;
//	}
//
//	public void setCasOrgManager(CasOrgManager casOrgManager) {
//		this.casOrgManager = casOrgManager;
//	}
//
//	public DjUserManager getDjUserManager() {
//		return djUserManager;
//	}
//
//	public void setDjUserManager(DjUserManager djUserManager) {
//		this.djUserManager = djUserManager;
//	}
//
//	public DjMemorgManager getDjMemorgManager() {
//		return djMemorgManager;
//	}
//
//	public void setDjMemorgManager(DjMemorgManager djMemorgManager) {
//		this.djMemorgManager = djMemorgManager;
//	}
//	
//	public DjUserroleManager getDjUserroleManager() {
//		return djUserroleManager;
//	}
//
//	public void setDjUserroleManager(DjUserroleManager djUserroleManager) {
//		this.djUserroleManager = djUserroleManager;
//	}

	public String execute(){
//			DjUser loginUser = new DjUser();
//			//DjMemorg djMemorg = new DjMemorg();
//			//yangshuai 2013-11-11
//			CasOrg casOrg =new CasOrg();
//			Authentication auth = SecurityContextHolder.getContext().getAuthentication();	
//			
//			if (auth != null && !"anonymousUser".equals(auth.getName())) {
//				loginUser = djUserManager.findByUsername(auth.getName());
//				int n=new Long(loginUser.getOrgid()).intValue();
//				casOrg = casOrgManager.findById(n);	
//			}
//			HashMap map = new HashMap();
//			map.put("username",loginUser.getUsername());
//			map.put("userAmont", loginUser.getUserAmont());
//			map.put("lastlogin", loginUser.getLastloginString());
//			map.put("lastlogout", loginUser.getLastlogoutString());
//			map.put("userId", loginUser.getUserId());
//			//yangshuai 2013 11-11
//			map.put("casOrg", casOrg);
////			map.put("orgName", casOrg.getFullname());
//			String userName = loginUser.getUsername();
//			if(userName==null || userName.equals("")){
//				map.put("flag", "0");
//			}else{
//				map.put("flag", "1");
//			}
//			
//			HttpServletRequest request = getRequest();
//			request.getSession().setAttribute("casOrg", casOrg);
//			//JSONArray user = JSONArray.fromObject(map);
//
//			Collection<GrantedAuthority> roles = auth.getAuthorities();
//			String rolename = "anonymousUser";
//			for(GrantedAuthority authority: roles ){
//				rolename = authority.getAuthority();
//				break;//只限于系统用户只有一个角色的情况
//			}
			/*if(rolename.equals("ROLE_XADMIN")||rolename.equals("ROLE_ADMIN")||rolename.equals("ROLE_ADMIN_COURSE")||rolename.equals("ROLE_ADMIN_MARKET")||rolename.equals("ROLE_ACTIVITY")){
				return ADMIN_TOP;
			}else if(rolename.equals("ROLE_SOCIETY")){
				adminNamesPrepare(djMemorg.getOrgNotary());
				return SOCIETY_TOP;
			}else if(rolename.equals("ROLE_MEMBER")){
				return MEMBER_TOP;
			}else {
				return null;
			}*/
		
//			if(rolename.equals("ROLE_SOCIETY")){
//				adminNamesPrepare(casOrg.getDomain());
//				return SOCIETY_TOP;
//			}else if(rolename.equals("ROLE_MEMBER")){
//				return MEMBER_TOP;
//			}else {
//				return ADMIN_TOP;
//			}
			
			
			return ADMIN_TOP;
	}
}
   
