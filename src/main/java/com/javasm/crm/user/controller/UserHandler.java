package com.javasm.crm.user.controller;

import com.github.pagehelper.PageInfo;
import com.javasm.crm.common.utils.Msg;
import com.javasm.crm.user.entity.User;
import com.javasm.crm.user.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
@RestController
public class UserHandler {

    @Resource
    private UserService userService;

    /**
     * 查询修改用户数据
     * @param uid
     * @return
     */
    @RequestMapping(value = "/selectOneUser/{uid}", method = RequestMethod.GET)
    public User selectOneUser(@PathVariable("uid") int uid) {
        User user = userService.selectByPrimaryKey(uid);
        return user;
    }


    /**
     * 进入用户管理界面分页查询全部用户
     *
     * @param page
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public Msg getUser(@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "10") int pageSize,User user) {
        PageInfo<User> userPageInfo = userService.selectAllUserwithPage(page, pageSize,user);
        return Msg.success().add("pageInfo", userPageInfo);
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Msg addUser(User user) {
        int i = userService.insertSelective(user);
        if (i == 0) {
            return Msg.fail();
        }
        return Msg.success();
    }

    /**
     * 修改用户数据
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "/update/{uid}", method = RequestMethod.PUT)
    public Msg updateUser(User user) {
        int i = userService.updateByPrimaryKeySelective(user);
        if (i == 0) {
            return Msg.success();
        }
        return Msg.success();
    }

    /**
     * 单个\多选批量删除二合一
     *
     * @param uid
     * @return
     */
    @RequestMapping(value = "/delete/{uid}", method = RequestMethod.DELETE)
    public Msg deleteUser(@PathVariable("uid") String uid) {
        List<Integer> listUid = new ArrayList<>();
        int i = 0;
        if (uid.contains("-")) {
            String[] uids = uid.split("-");
            for (String s : uids) {
                listUid.add(Integer.parseInt(s));
            }
            i = userService.batchDeleteUsers(listUid);
        } else {
            i = userService.deleteByPrimaryKey(Integer.parseInt(uid));
        }
        if (i == 0) {
            return Msg.fail();
        }
        return Msg.success();
    }
}
