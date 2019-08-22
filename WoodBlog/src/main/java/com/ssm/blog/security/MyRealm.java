package com.ssm.blog.security;

import com.ssm.blog.entity.User;
import com.ssm.blog.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

public class MyRealm extends AuthorizingRealm {
    @Autowired
    private UserService userService;

    /**
     *@Author Lyon[flowingsun007@163.com]
     *@Date 18/09/12 09:59
     *@Param [principalCollection]
     *@Return org.apache.shiro.authz.AuthorizationInfo
     *@Description doGetAuthorizationInfo
     * 用户角色及权限认证
     * 根据用户的userId查询其所有的角色role即权限permission,最后将信息装入authorizationInfo返回
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
//        Long userId = (Long)SecurityUtils.getSubject().getSession().getAttribute("userId");
//        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
//        if(userId!=null){
//            User user = userService.getUserByUserId(userId);
//            if(user.getRoleList()!=null){
//                for(Role role :user.getRoleList()){
//                    authorizationInfo.addRole(role.getRole());
//                    for(Permission permission :role.getPermissionList()){
//                        authorizationInfo.addStringPermission(permission.getPermission());
//                    }
//                }
//            }
//        }else{
//            authorizationInfo=null;
//        }
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String username = (String) authenticationToken.getPrincipal(); // 获取用户名
        User user = userService.getUserByName(username); // 根据用户名从数据库中查询出博主信息
        if (user != null) {
            SecurityUtils.getSubject().getSession().setAttribute("user", user);//把当前用户存到session中
            AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(
                    user.getUserName(), user.getUserPass(), "MyRealm");
            return authcInfo;
        } else {
            return null;
        }
    }
}

