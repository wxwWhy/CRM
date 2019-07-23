package com.javasm.crm.user.mapper;

import com.javasm.crm.user.entity.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer uid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer uid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    int updateBatch(List<User> list);

    int batchInsert(@Param("list") List<User> list);

    @Select("SELECT * FROM user WHERE login_name = #{loginName} AND password = #{password}")
    User selectUser(User user);

    List<User> selectAllUser(User user);

    /**
     * 根据主键批量删除
     *
     * @param uid
     * @return
     */
    int batchDeleteUsers(List<Integer> uid);
}