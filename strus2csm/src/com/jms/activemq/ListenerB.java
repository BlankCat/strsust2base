package com.jms.activemq;   
  
import javax.jms.JMSException;   
import javax.jms.Message;   
import javax.jms.Session;   
  
public class ListenerB extends AbstractListener {   
  
    @Override  
    void initCreateFile() {        
  
    }   
       
    @Override  
    public void onMessage(Message message, Session session) throws JMSException {   
        System.out.println("------listenerB");   
  
    }   
}  
