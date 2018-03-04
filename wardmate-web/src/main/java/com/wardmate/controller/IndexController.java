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
import org.springframework.web.bind.annotation.*;

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
    public String checkUserInformation(@RequestParam("validationCode") String validationCode,
                                       ModelMap modelMap, HttpSession session, User userToLogin){
        //使用@ModelAttribute("preparedUser") User preparedUser 不能从model中获取名为preparedUser的Object
        // 会被表单提交数据填充导致 userToLogin === preparedUser 之前能正常工作的...
        User preparedUser = (User) modelMap.get("preparedUser");
        if(validationCode != null && validationCode.equals(session.getAttribute(WebAppConstant.VALIDATION_CODE))){
            if (preparedUser != null &&
                    userToLogin.getPassword().equals(preparedUser.getPassword())){
                //登录成功，session存入用户信息，返回登录前的页面
                session.setAttribute(WebAppConstant.LOGIN_SESSION_HEAD,preparedUser.getName());
                session.setAttribute(WebAppConstant.LOGIN_SESSION_ID,preparedUser.getId());
                session.setAttribute(WebAppConstant.LOGIN_SESSION_BODY,preparedUser);
                String lastURL = (String) session.getAttribute(WebAppConstant.URL_INTERCEPTED);
                if(lastURL == null || lastURL.equals("")) lastURL="/welcome?menuIndex=1";
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
        if(validationCode != null && validationCode.equals(session.getAttribute(WebAppConstant.VALIDATION_CODE))){
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

    @ResponseBody
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();//清除session中的全部信息
        return SimpleHttpMessage.LOGOUT_SUCCESS;
    }

    @RequestMapping("/welcome/gotoUserProfile/{userId}")
    public String gotoUserProfile(@PathVariable Integer userId,ModelMap modelMap){
        userService.prepareUserProfile(userId);//返回true表示第一次打开设置页
        //更新内容的需求：更改、清空、保持不变
        // 方案：将全部字段传入前台，再进行接收，不允许修改的使用隐藏域，允许用户传空值进行删除
        UserAndProfile userAndProfile = userService.getUserProfileAndSettings(userId);
        userAndProfile.setPassword("");
        System.out.println(userAndProfile);
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

    @ModelAttribute(value = "preparedUser")
    public User prepareUser(@RequestParam(name = "name", required = false) String userName){
        User preparedUser = new User();
        if ( userName != null && !userName.equals("")){
            //注册时此处user为null，但不影响注册方法获取POST提交的user属性
            //@ModelAttribute在其他controller方法前执行，此处用于根据request中包含的参数name补全User对象的属性
            User user = userService.getUserByName(userName);
            if(user != null){
                preparedUser = user;
            }
        }
        return preparedUser;
    }

}
