package com.ssm.blog.controller.admin;

import com.ssm.blog.entity.Article;
import com.ssm.blog.entity.Comment;
import com.ssm.blog.entity.User;
import com.ssm.blog.service.ArticleService;
import com.ssm.blog.service.CommentService;
import com.ssm.blog.service.UserService;
import com.ssm.blog.util.CryptographyUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.ssm.blog.util.MyUtils.getIpAddr;


@Controller
public class AdminController {
    @Autowired
    private UserService userService;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CommentService commentService;

    /**
     * 后台首页
     *
     * @return
     */
    @RequestMapping("/admin")
    public String index(Model model)  {
        //文章列表
        List<Article> articleList = articleService.listRecentArticle(5);
        model.addAttribute("articleList",articleList);
        //评论列表
        List<Comment> commentList = commentService.listRecentComment(5);
        model.addAttribute("commentList",commentList);
        return "Admin/index";
    }

    /**
     * 登录页面显示
     *
     * @return
     */
    @RequestMapping("/login")
    public String loginPage() {
        return "Admin/login";
    }

    /**
     * 登录验证
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/loginVerify",method = RequestMethod.POST)
    @ResponseBody
    public String loginVerify(HttpServletRequest request, HttpServletResponse response)  {
        Map<String, Object> map = new HashMap<String, Object>();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberme = request.getParameter("rememberme");
        User user = userService.getUserByNameOrEmail(username);
        Subject subject = SecurityUtils.getSubject(); //获取当前登陆的主体
        String newPassword = CryptographyUtil.md5(password, username);//将密码使用md5加密
        //将用户信息封装到token中
        UsernamePasswordToken token = new UsernamePasswordToken(username, newPassword);
        try {
            subject.login(token);//会调用MyRealm中的doGetAuthenticationInfo方法进行身份认证
            map.put("code",1);
            if(rememberme!=null) {
                //创建两个Cookie对象
                Cookie nameCookie = new Cookie("username", username);
                //设置Cookie的有效期为3天
                nameCookie.setMaxAge(60 * 60 * 24 * 3);
                Cookie pwdCookie = new Cookie("password", password);
                pwdCookie.setMaxAge(60 * 60 * 24 * 3);
                response.addCookie(nameCookie);
                response.addCookie(pwdCookie);
            }
            user.setUserLastLoginTime(new Date());
            user.setUserLastLoginIp(getIpAddr(request));
            userService.updateUser(user);
            String result = new JSONObject(map).toString();
            return result;
        } catch (AuthenticationException e) {
            e.printStackTrace();
            map.put("code",0);
            String result = new JSONObject(map).toString();
            return result;
        }

//        if(user==null) {
//            map.put("code",0);
//            map.put("msg","用户名无效！");
//        } else if(!user.getUserPass().equals(password)) {
//            map.put("code",0);
//            map.put("msg","密码错误！");
//        } else {
            //登录成功
//            map.put("code",1);
//            map.put("msg","");
//            //添加session
//            request.getSession().setAttribute("user", user);
            //添加cookie
//            if(rememberme!=null) {
//                //创建两个Cookie对象
//                Cookie nameCookie = new Cookie("username", username);
//                //设置Cookie的有效期为3天
//                nameCookie.setMaxAge(60 * 60 * 24 * 3);
//                Cookie pwdCookie = new Cookie("password", password);
//                pwdCookie.setMaxAge(60 * 60 * 24 * 3);
//                response.addCookie(nameCookie);
//                response.addCookie(pwdCookie);
//            }
//            user.setUserLastLoginTime(new Date());
//            user.setUserLastLoginIp(getIpAddr(request));
//            userService.updateUser(user);

//        }
//        String result = new JSONObject(map).toString();
//        return result;
    }

    /**
     * 退出登录
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/admin/logout")
    public String logout(HttpSession session)  {
        SecurityUtils.getSubject().logout();
//        session.removeAttribute("user");
//        session.invalidate();
        return "redirect:/login";
    }


}
