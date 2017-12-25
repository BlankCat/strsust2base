package com.jms.activemq;   
  
import java.util.Map;   
  
import javax.jms.JMSException;   
import javax.jms.Message;   
import javax.jms.Session;   
  
public class ListenerA extends AbstractListener {   
  
    @Override  
    void initCreateFile() {   
           
    }   
  
    @Override  
    public void onMessage(Message message, Session session) throws JMSException {   
        Map<String,byte[]> map = (Map<String,byte[]>)this.getMessageConverter().fromMessage(message);   
        System.out.println("----"+map.get("fileName"));   
    }   
  
}  
