package com.wardmate.controller;

import com.google.common.collect.Maps;
import com.wardmate.constant.SimpleHttpMessage;
import com.wardmate.constant.WebAppConstant;
import com.wardmate.dto.UserAndProfile;
import com.wardmate.enumration.Gender;
import com.wardmate.model.User;
import com.wardmate.model.UserProfile;
import com.wardmate.serviceInterface.IUserService;
import com.wardmate.utils.ValidationCode;
import com.wardmate.utils.ValidationImage;
import com.wardmate.utils.MD5;
import com.wardmate.vo.FeedbackMessage;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Controller
public class IndexController {
    private Logger logger = LogManager.getLogger();
    private FeedbackMessage message;
    private Map<Integer,String> genderMap;
    @Autowired
    private IUserService userService;

    public IndexController() {
        genderMap = Maps.newHashMap();
        List<Gender> genders = Arrays.asList(Gender.values());
        genders.stream().forEach(gender -> genderMap.put(gender.getIndex(),gender.getGenderName()));
    }

    @RequestMapping("/welcome")
    public String gotoIndex(){
        return "/welcome";
    }

    @RequestMapping("/login")
    public String gotoLogin(){
        return "/common/login";
    }
    @RequestMapping("/logon")
    public String gotoLogon(ModelMap modelMap){
        modelMap.put("genders",genderMap);
        return "/common/logon";
    }

    @RequestMapping("/welcome/userLogin")
    public String checkUserInformation(@RequestParam("validationCode") String validationCode, User userToLogin, @ModelAttribute("preparedUser") User preparedUser,
                                       ModelMap modelMap, HttpSession session){
        if(validationCode != null && validationCode.equals(session.getAttribute(WebAppConstant.VALIDATION_CODE))){
            if (preparedUser != null &&
                    userToLogin.getPassword().equals(preparedUser.getPassword())){
                //登录成功，session存入用户信息，返回登录前的页面
                session.setAttribute(WebAppConstant.LOGIN_SESSION_HEAD,preparedUser.getName());
                session.setAttribute(WebAppConstant.LOGIN_SESSION_BODY,preparedUser);
                String lastURL = (String) session.getAttribute(WebAppConstant.URL_INTERCEPTED);
                if(lastURL == null || lastURL.equals("")) lastURL="/welcome";
                return "forward:"+lastURL;
            }else {
                modelMap.put("message",SimpleHttpMessage.LOGIN_FAILED);
                return "/common/login";
            }
        }else {
            modelMap.put("message",SimpleHttpMessage.VALIDATION_ERROR);
            return "/common/login";
        }
    }

    @RequestMapping("/welcome/createUser")
    public String createAccount(@RequestParam("validationCode") String validationCode, User user,
                                ModelMap modelMap, HttpSession session){
        if(validationCode != null && validationCode.equals(session.getAttribute("validationCode"))){
            //用户注册时后台可见明文密码
            String passwordToStore = MD5.getMD5String(user.getName()+MD5.getMD5String(user.getPassword()));
            user.setPassword(passwordToStore);
            userService.registerNewUser(user);
            message = new FeedbackMessage();
            message.setTitle("注册成功");
            message.setContent("恭喜，您已成功注册病友网账户");
            message.setTargetURL("/login");
            modelMap.put("message",message);
            return "/feedback/success";
        }else {
            modelMap.put("preparedUser",user);
            modelMap.put("message", SimpleHttpMessage.VALIDATION_ERROR);
            //return "/common/logon";将导致丢失genderMap，页面出错
            return "forward:/logon";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute(WebAppConstant.LOGIN_SESSION_HEAD);
        session.removeAttribute(WebAppConstant.LOGIN_SESSION_BODY);
        return "/welcome";
    }

    @RequestMapping("/welcome/gotoUserProfile/{userId}")
    public String gotoUserProfile(@PathVariable Integer userId,ModelMap modelMap){
        userService.prepareUserProfile(userId);//返回true表示第一次打开设置页
        //更新内容的需求：更改、清空、保持不变
        // 方案：将全部字段传入前台，再进行接收，不允许修改的使用隐藏域，允许用户传空值进行删除
        UserAndProfile userAndProfile = userService.getUserProfileAndSettings(userId);
        userAndProfile.setPassword("");
        modelMap.put("genders",genderMap);
        modelMap.put("userAndProfile",userAndProfile);
        return "/common/userprofile";
    }

    @RequestMapping("/validationCodeImage")
    public void getValidationCode(HttpServletResponse response, HttpSession session) throws IOException {
        String validationCode = ValidationCode.getValidationCode();
        BufferedImage bufferedImage = ValidationImage.createImage(validationCode);
        session.setAttribute(WebAppConstant.VALIDATION_CODE,validationCode);
        response.setHeader("Pragma","no-cache");
        response.setHeader("Cache-Control","no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");
        ServletOutputStream stream = response.getOutputStream();
        ImageIO.write(bufferedImage,"jpeg",stream);
        stream.close();
    }

    @ModelAttribute("preparedUser")
    public User prepareUser(@RequestParam(name = "name", required = false) String userName){
        User user;
        if ( userName != null && !userName.equals("")){
            //注册时此处user为null，但不影响注册方法获取POST提交的user属性
            //@ModelAttribute在其他controller方法前执行，可用于补全model属性，依据页面传入的id或name等字段
            //对于登录方法可以很好的工作，使用@ModelAttribute()获取
            //对于注册方法，因数据库中尚无记录，此处初始化会导致preparedUser为null,在验证码出错，表单回显时产生bug
            //注册出错回显时要将preparedUser替换为表单提交的内容
            user = userService.getUserByName(userName);
        }else {
            user = new User();
        }
        return user;
    }

}
