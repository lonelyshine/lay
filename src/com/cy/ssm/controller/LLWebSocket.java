package com.cy.ssm.controller;  
import java.io.IOException;  
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.CopyOnWriteArraySet;  
   
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;  
import javax.websocket.OnError;  
import javax.websocket.OnMessage;  
import javax.websocket.OnOpen;  
import javax.websocket.Session;  
import javax.websocket.server.ServerEndpoint;  


import com.cy.ssm.beans.UserBean;
import com.cy.ssm.service.TalkService;

// 该注解用来指定一个URI，客户端可以通过这个URI来连接到WebSocket。类似Servlet的注解mapping。无需在web.xml中配置。
@ServerEndpoint(value = "/lay",configurator=GetHttpSessionConfigurator.class)  
public class LLWebSocket  {

    //静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。  
    private static int onlineCount = 0;  
       
    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识  
    private static CopyOnWriteArraySet<LLWebSocket> webSocketSet = new CopyOnWriteArraySet<LLWebSocket>();  
       
    //与某个客户端的连接会话，需要通过它来给客户端发送数据  
    private Session session;
       
    private int userId;
    private HttpSession httpSession;
    
    
    /** 
     * 连接建立成功调用的方法 
     * @param session  可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据 
     */  
    @OnOpen  
    public void onOpen(Session session,EndpointConfig config){
        this.session = session; 
        this.httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        this.userId=((UserBean) httpSession.getAttribute("user")).getUserId();
        webSocketSet.add(this);     //加入set中  
        addOnlineCount();           //在线数加1  
        System.out.println("有新连接加入！当前在线人数为" + getOnlineCount());  
    }  
       
    /** 
     * 连接关闭调用的方法 
     */  
    @OnClose  
    public void onClose(){  
        webSocketSet.remove(this);  //从set中删除  
        subOnlineCount();           //在线数减1      
        System.out.println("有一连接关闭！当前在线人数为" + getOnlineCount());  
    }  
       
    /** 
     * 收到客户端消息后调用的方法 
     * @param message 客户端发送过来的消息 
     * @param session 可选的参数 
     */  
    @OnMessage  
    public void onMessage(String message, Session session) {
    	
        System.out.println("来自客户端的消息:" + message);
        String tempmessage = message.substring(message.indexOf("{")+1,message.lastIndexOf("}")); 
        String temp[] = tempmessage.split(",");
        String type = ((temp[3].split(":"))[1]).substring(((temp[3].split(":"))[1]).indexOf("\"")+1,((temp[3].split(":"))[1]).lastIndexOf("\""));
        //String content = ((temp[2].split(":"))[1]).substring(((temp[2].split(":"))[1]).indexOf("\"")+1,message.lastIndexOf("\""));
        int id = Integer.parseInt((temp[2].split(":"))[1]);
        if(type.equals("friend")){//表示发送给单独一个人
        	for(LLWebSocket item: webSocketSet){               
        		try {
        			if(item.userId==id){
        				item.sendMessage(message);  
        			}
        		} catch (IOException e) {  
        			e.printStackTrace();  
        			continue;  
        		}  
        	}  
    	}else if(type.equals("group")){//表示发送群组
    		String members = ((temp[9].split(":"))[1]).substring(((temp[9].split(":"))[1]).indexOf("\"")+1,((temp[9].split(":"))[1]).lastIndexOf("\""));
    		int mineid = Integer.parseInt((temp[10].split(":"))[1]);
    			for(LLWebSocket item: webSocketSet){               
    				try {
    					if(mineid!=item.userId&&members.contains(item.userId+"")){
    						item.sendMessage(message);  
    					}
    				} catch (IOException e) {  
    					e.printStackTrace();  
    					continue;  
    				}  
    		}
    	}
        
    }  
    
    
    public static void main(String []args){
    	String message ="{'username':'石满','avatar':'img/profile_small.jpg','id':1,'type':'group','content':'阿斯顿发号爱上的叫法按时打卡机','cid':0,'mine':false,'fromid':2,'timestamp':1495547075697,'members':'1,2,3'}";
    	 String tempmessage = message.substring(message.indexOf("{")+1,message.lastIndexOf("}")); 
         String temp[] = tempmessage.split(",");
         String type = ((temp[9].split(":"))[1]).substring(((temp[9].split(":"))[1]).indexOf("\"")+1,((temp[9].split(":"))[1]).lastIndexOf("\""));
         //String content = ((temp[2].split(":"))[1]).substring(((temp[2].split(":"))[1]).indexOf("\"")+1,message.lastIndexOf("\""));
         int id = Integer.parseInt((temp[2].split(":"))[1]);
    }
        
    
    /** 
     * 发生错误时调用 
     * @param session 
     * @param error 
     */  
    @OnError  
    public void onError(Session session, Throwable error){  
        System.out.println("发生错误");  
        error.printStackTrace();  
    }  
    
    
    /** 
     * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。 
     * @param message 
     * @throws IOException 
     */  
    public void sendMessage(String message) throws IOException{  
        this.session.getBasicRemote().sendText(message);  
        //this.session.getAsyncRemote().sendText(message);  
    }  
   
    public static synchronized int getOnlineCount() {  
        return onlineCount;  
    }  
   
    public static synchronized void addOnlineCount() {  
        LLWebSocket.onlineCount++;  
    }  
       
    public static synchronized void subOnlineCount() {  
        LLWebSocket.onlineCount--;  
    }  
}  