<%@page pageEncoding="UTF-8"%>
<%@page import="javax.servlet.ServletOutputStream"%>
<%@page import="java.io.*"%>
<%
      String path = request.getContextPath();
      String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
      String filepath = request.getParameter("filepath");
     // String localFile = basePath+"fileManager//"+filepath;
      String localFile = filepath;
      String filename = request.getParameter("filename");
      /* 
      String []temp = filename.split("\\.");
      String type = temp[temp.length-1];
      if(tyype.equals("fa-file-image-o")){
      
      }else if(){
      
      } */
      
      
      out.clear(); 
      out=pageContext.pushBody();
      
      System.out.println(">>>>download file is "+localFile);
	  byte[] buffer = new byte[512]; 
	  int size = 0; 
	  response.reset();
	  response.setContentType("multipart/form-data");
 	  //response.setHeader("Content-disposition", "attachment;filename=\""+ java.net.URLEncoder.encode(localFile,"UTF-8") + "\"");
 	// String excelName =  StringUtil.htmlFilter(request.getAttribute("excelname").toString());
 	 System.out.println(filename);
 	  response.setHeader("Content-disposition", "attachment;filename=\""+ java.net.URLEncoder.encode(filename,"UTF-8") + "\"");
	  ServletOutputStream os = null;
	  FileInputStream in = null;
	  try {
	     os = response.getOutputStream();
	     File downloadFile=new File(localFile);
	     if(downloadFile!=null&&downloadFile.exists()){
		     in = new FileInputStream(new File(localFile));
		     while ((size = in.read(buffer)) != -1) { 
		       os.write(buffer, 0, size); 
		     }
		    out.clear();
         	out = pageContext.pushBody();
	     }else{
	        out.print("文件不存在"); //"文件不存在！"
	     }
  	   } catch(Exception e) {
          e.printStackTrace();
       } finally {
            try {
             if(in!=null)in.close();
		     if(os!=null)os.close();
		     File file=new File(localFile);
		     if (file!=null&&file.isFile()&&file.exists()) {
		       file.delete();
		     }

		   } catch (IOException e) {
		     e.printStackTrace();
		   }
       }
%>