package com.javasm.crm.user.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.javasm.crm.user.entity.User;
import com.javasm.crm.user.mapper.UserMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserService {

    @Resource
    private UserMapper userMapper;

    public int deleteByPrimaryKey(Integer uid) {
        return userMapper.deleteByPrimaryKey(uid);
    }

    public int insert(User record) {
        return userMapper.insert(record);
    }

    public int insertSelective(User record) {
        return userMapper.insertSelective(record);
    }

    public User selectByPrimaryKey(Integer uid) {
        return userMapper.selectByPrimaryKey(uid);
    }

    public int updateByPrimaryKeySelective(User record) {
        return userMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(User record) {
        return userMapper.updateByPrimaryKey(record);
    }

    public User selectUser(User user) {
        return userMapper.selectUser(user);
    }

    public int updateBatch(List<User> list) {
        return userMapper.updateBatch(list);
    }

    public int batchInsert(List<User> list) {
        return userMapper.batchInsert(list);
    }

    public List<User> selectAllUser(User user) {
        return userMapper.selectAllUser(user);
    }

    public PageInfo<User> selectAllUserwithPage(int page, int pageSize,User user) {
        PageHelper.startPage(page, pageSize);
        return new PageInfo<>(userMapper.selectAllUser(user));
    }

    public int batchDeleteUsers(List<Integer> uid) {
        return userMapper.batchDeleteUsers(uid);
    }
}





