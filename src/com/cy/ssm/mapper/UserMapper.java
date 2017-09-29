package com.cy.ssm.mapper;


import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.cy.ssm.beans.UserBean;


public interface UserMapper {
	
	
	/**
	 * ��¼
	 * @param userName
	 * @param password
	 * @return
	 * @throws Exception
	 */
	@Select("select userId,userCode,userName,email,age,sex,birthday,tel,qq,address,avatar,brief from userinfo where userCode=#{un} and userPassword=#{pw}")
    @Results({
		
		@Result(id=true,property="userId",column="userId",javaType=Integer.class),
		@Result(property="userCode",column="userCode",javaType=String.class),
		@Result(property="userName",column="userName",javaType=String.class),
		@Result(property="userPassword",column="userPassword",javaType=String.class),
		@Result(property="age",column="age",javaType=Integer.class),
		@Result(property="sex",column="sex",javaType=String.class),
		@Result(property="birthday",column="birthday",javaType=Date.class),
		@Result(property="tel",column="tel",javaType=String.class),
		@Result(property="qq",column="qq",javaType=String.class),
		@Result(property="email",column="email",javaType=String.class),
		@Result(property="emailUser",column="emailUser",javaType=String.class),
		@Result(property="emailPassword",column="emailPassword",javaType=String.class),
		@Result(property="verfiyCode",column="verfiyCode",javaType=String.class),
		@Result(property="address",column="address",javaType=String.class),
		@Result(property="avatar",column="avatar",javaType=String.class),
		@Result(property="brief",column="brief",javaType=String.class)
	})
	public UserBean login(@Param("un")String userCode,@Param("pw")String userPassword);
	
	//通过userId获取邮箱名和密码
	public List<HashMap<String,Object>> getEmailUserPs(@Param(value="userId") int userId);
	
	//将生成的验证码存储到用户表中
	public void insertCode(@Param(value="getEmailperson") String getEmailperson,@Param(value="code") String code);
	
	//通过用户名查询邮箱
	public List<HashMap<String,Object>> getNameCode(@Param(value="nameCode") String nameCode);
	
	//修改密码
	public void updatePassword(@Param(value="userCode") String userCode,@Param(value="userPassword") String userPassword);
	
	//用户注册
	public void register(@Param(value="id") String id,@Param(value="userCode") String userCode,@Param(value="userName") String userName,@Param(value="userPassword") String userPassword,@Param(value="email") String email);
	
	//获取用户表中的用户最大的id
  	public List<HashMap<String,Object>> getUserId();
  	
  	
  //将头像图片插入到用户表中
    public void updateAvatar(@Param(value="userid") String userid,@Param(value="avatar") String avatar);
  	
  //将用户信息保存到用户表中
    public void updateUserInfo(@Param(value="userId") int userId,@Param(value="userName") String userName,@Param(value="userAge") String userAge,@Param(value="userSex") String userSex,@Param(value="birthday") String userBirthday,@Param(value="userTel") String userTel,@Param(value="userQq") String userQq,@Param(value="userEmail") String userEmail,@Param(value="userAddress") String userAddress,@Param(value="userBrief") String userBrief);
    
    
  	
	/**
	 * �����Ñ�
	 * @param user
	 * @return
	 * @throws Exception
	 */
	@Insert("insert into t_user value (null,user.username,user.password,user.account)")
	@Options(useGeneratedKeys=true,keyProperty="user.id")
	public int insertUser(@Param("user")UserBean user) throws Exception;
	
	
	/**
	 * �޸��Ñ�
	 * @param user
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@Update(" update t_user set username=#{u.username},password=#{u.password},account=#{u.account} where id=#{id}")
    public int updateUser (@Param("u")UserBean user,@Param("id")int id) throws Exception;
	
     /**
      * �h���Ñ�
      * @param id
      * @return
      * @throws Exception
      */
	@Delete(" delete from t_user where id=#{id}  ")
    public int deleteUser(int id) throws Exception;
	
	
    /**
     * ���id��ѯ�û���Ϣ
     * @param id
     * @return
     * @throws Exception
     */
	
	@Select(" select * from t_user where id=#{id}")
	@Results({
		
		@Result(id=true,property="id",column="id",javaType=Integer.class),
		@Result(property="username",column="username",javaType=String.class),
		@Result(property="password",column="password",javaType=String.class),
		@Result(property="account",column="account",javaType=Double.class)
	})
    public UserBean selectUserById(int id) throws Exception;
     /**
      * ��ѯ���е��û���Ϣ
      * @return
      * @throws Exception
      */
	
	@Select(" select * from t_user")
	@ResultMap("userMap")
    public List<UserBean> selectAllUser() throws Exception;
    
    
    /**
     * ��������
     * @param user
     * @return
     * @throws Exception
     */
   public int batchInsertUser(@Param("users")List<UserBean> user) throws Exception;
   
   /**
    * ����ɾ��
    * @param list
    * @return
    * @throws Exception
    */
   public int batchDeleteUser(@Param("list")List<Integer> list) throws Exception;
   
   
   /**
    * ��ҳ��ѯ���
    * @param parma
    * @return
    * @throws Exception
    */
   public List<UserBean> pagerUser(Map<String, Object> parmas) throws Exception;
   
   /**
    * 
    * ��ҳͳ�����
    * @param parma
    * @return
    * @throws Exception
    */
    public int countUser(Map<String, Object> parmas) throws Exception;
    
  
    
    
}
