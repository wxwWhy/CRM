package com.javasm.crm.aspect.controller;

import java.lang.reflect.Method;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.javasm.crm.aspect.entity.Slog;
import com.javasm.crm.aspect.service.LogService;
import com.javasm.crm.aspect.util.SerializeUtil;
import com.javasm.crm.aspect.util.ValidateUtil;
import com.javasm.crm.user.entity.User;

import redis.clients.jedis.Jedis;

@Aspect
@Component
public class SystemLogAspect {
		@Autowired
		private LogService logService;
		// 日志记录对象
		private static final Logger logger = LogManager.getLogger(SystemLogAspect.class);

		// Service层切点  com.javasm.crm.goodsAndGifts.service 
		@Pointcut("execution(* com.javasm.crm.*.service.*.*(..))")
		public void serviceAspect() {
		}


		/**
		 * 前置通知 记录用户的操作
		 * 
		 * @param joinPoint
		 *            切点
		 */
		@Before("serviceAspect()")
		public void doBefore(JoinPoint joinPoint) {
			logger.debug("========数据库日志======Begin===");
			BigInteger time = new BigInteger(System.currentTimeMillis()+"");
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String timestr = df.format(new Date(new Long(time+"")));
			Slog slog = new Slog();
			Jedis jedis = new Jedis("192.168.14.243",6379);
			jedis.auth("root");
//			String ping = jedis.ping();
//			System.out.println("test-------"+ping);
			try {
				HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
				HttpSession session = request.getSession();
				User user = (User) session.getAttribute("loginUser");
				logger.debug("请求人："+user.getUname());
				logger.debug("请求时间："+timestr);
				logger.debug("请求内容方法：:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));
				slog.setTime(timestr);
				slog.setUsername(user.getUname());
				slog.setContent("请求内容方法：:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));
				jedis.set(timestr.getBytes(), SerializeUtil.serialize(slog));
				new Thread() {
					@Override
					public void run() {
						byte[] jekey = jedis.get(timestr.getBytes());
						Slog unslog = (Slog) SerializeUtil.unserialize(jekey);
						System.out.println("test---------------:"+unslog);
						int insertSlog = logService.insertSlog(unslog);
						if (insertSlog>0) {
							System.out.println("插入mysql成功");
						}else {
							System.out.println("插入mysql失败");
						}
						jedis.close();
					}
				}.start();
			} catch (Exception e) {
				logger.error("==前置通知异常==");
				logger.error("异常信息:{}", e.getStackTrace());
			}
			
			
			
			
			
//			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
//			HttpSession session = request.getSession();
//			// 读取session中的用户
//			User user = (User) session.getAttribute("user");
//			BigInteger time = new BigInteger(System.currentTimeMillis()+"");
//			try {
//				if(ValidateUtil.isObjectNotnull(getControllerMethodDescription(joinPoint))){
//					// *========控制台输出=========*//
//					System.out.println("请求方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));
//					System.out.println("方法描述:" + getControllerMethodDescription(joinPoint));
//					
//					// *========数据库日志=========*//
//					Slog log = new Slog();
//					if(ValidateUtil.isObjectNotnull(user)){
//						System.out.println("请求人:" + user.getLoginName());
//						log.setUserid(user.getUid());
//					}else{
//						System.out.println("请求人:null");
//					}
//					
//					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//					String timestr = df.format(new Date(new Long(time+"")));
//					System.out.println("请求时间:" + timestr);
//					log.setContent(getControllerMethodDescription(joinPoint));
//					log.setTime(time);
//					log.setLogtype(1601);
//					// 保存数据库
//					logger.info(".............Controller操作日志保存开始.............");
//					this.logService.save(log);
//					logger.info(".............Controller操作日志保存结束.............");
//				}
//			} catch (Exception e) {
//				System.out.println(e);
//				// 记录本地异常日志
//				logger.error("==前置通知异常==");
//				logger.error("异常信息:{}", e.getMessage());
//			}
		}

		/**
		 * 异常通知 用于拦截service层记录异常日志
		 * @param joinPoint
		 * @param e
		 */
//		@AfterThrowing(pointcut = "serviceAspect()", throwing = "e")
//		public void doAfterThrowing(JoinPoint joinPoint, Throwable e) {
//			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
//			HttpSession session = request.getSession();
//			// 读取session中的用户
//			User user = (User) session.getAttribute("user");
//			BigInteger time = new BigInteger(System.currentTimeMillis()+"");
//			// 获取用户请求方法的参数并序列化为JSON格式字符串
//			String params = "";
//			if (joinPoint.getArgs() != null && joinPoint.getArgs().length > 0) {
//				for (int i = 0; i < joinPoint.getArgs().length; i++) {
//					params += joinPoint.getArgs()[i] + ";";
//				}
//			}
//			try {
//				/* ========控制台输出========= */
//				System.out.println("异常代码:" + e.getClass().getName());
//				System.out.println("异常信息:" + e.getMessage());
//				System.out.println("异常方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));
//				System.out.println("方法描述:" + getServiceMthodDescription(joinPoint));
//				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//				String timestr = df.format(new Date(new Long(time+"")));
//				System.out.println("请求时间:" + timestr);
//				/* ==========数据库日志========= */
//				Slog log = new Slog();
//				if(ValidateUtil.isObjectNotnull(user)){
//					System.out.println("请求人:" + user.getUid());
//					log.setUserid(user.getUid());
//				}else{
//					System.out.println("请求人:null" );
//				}
//				System.out.println("请求参数:" + params);
//				log.setContent("异常代码:" + e.getClass().getName()+",异常信息:" + e.getMessage()+",异常方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()")+",方法描述:" + getServiceMthodDescription(joinPoint));
//				log.setTime(time);
//				log.setLogtype(1602);
//				// 保存数据库
//				logger.info(".............Service操作日志保存开始.............");
//				this.logService.save( log );
//				logger.info(".............Service操作日志保存结束.............");
//				
//			} catch (Exception ex) {
//				ex.printStackTrace();
//				// 记录本地异常日志
//				logger.error("==异常通知异常==");
//				logger.error("异常信息:{}", ex.getMessage());
//			}
//		}

		/**
		 * 获取注解中对方法的描述信息 用于service层注解
		 * 
		 * @param joinPoint
		 *            切点
		 * @return 方法描述
		 * @throws Exception
		 */
//		public static String getServiceMthodDescription(JoinPoint joinPoint)
//				throws Exception {
//			String targetName = joinPoint.getTarget().getClass().getName();
//			String methodName = joinPoint.getSignature().getName();
//			Object[] arguments = joinPoint.getArgs();
//			Class targetClass = Class.forName(targetName);
//			Method[] methods = targetClass.getMethods();
//			String description = "";
//			for (Method method : methods) {
//				if (method.getName().equals(methodName)) {
//					Class[] clazzs = method.getParameterTypes();
//					if (clazzs.length == arguments.length) {
//						description = ValidateUtil.isObjectNotnull(method.getAnnotation(SystemServiceLog.class))?method.getAnnotation(SystemServiceLog.class).description():"";
//						break;
//					}
//				}
//			}
//			return description;
//		}

		/**
		 * 获取注解中对方法的描述信息 用于Controller层注解
		 * 
		 * @param joinPoint
		 *            切点
		 * @return 方法描述
		 * @throws Exception
//		 */
//		public static String getControllerMethodDescription(JoinPoint joinPoint)
//				throws Exception {
//			String targetName = joinPoint.getTarget().getClass().getName();
//			String methodName = joinPoint.getSignature().getName();
//			Object[] arguments = joinPoint.getArgs();
//			Class targetClass = Class.forName(targetName);
//			Method[] methods = targetClass.getMethods();
//			String description = "";
//			for (Method method : methods) {
//				if (method.getName().equals(methodName)) {
//					Class[] clazzs = method.getParameterTypes();
//					if (clazzs.length == arguments.length) {
////						description = method.getAnnotation( SystemControllerLog.class).description();
//						description = ValidateUtil.isObjectNotnull(method.getAnnotation(SystemControllerLog.class))?method.getAnnotation(SystemControllerLog.class).description():"";
//						break;
//					}
//				}
//			}
//			return description;
//		}
}
