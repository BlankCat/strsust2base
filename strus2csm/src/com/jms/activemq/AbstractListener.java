package com.jms.activemq;
import javax.jms.JMSException;   
import javax.jms.Message;   
import javax.jms.MessageListener;   
import javax.jms.Session;   
  
import org.springframework.jms.listener.SessionAwareMessageListener;   
import org.springframework.jms.support.converter.MessageConverter;   
  
public abstract class AbstractListener implements MessageListener,SessionAwareMessageListener{   
       
    private MessageConverter messageConverter;   
       
    public void onMessage(Message message) {   
        try {                          
            onMessage(message, null);                  
        }   
        catch (Throwable ex) {   
            ex.printStackTrace();   
        }   
    }   
    public abstract void onMessage(Message message, Session session) throws JMSException;   
       
    abstract void initCreateFile();   
       
    public MessageConverter getMessageConverter() {   
        return messageConverter;   
    }   
    public void setMessageConverter(MessageConverter messageConverter) {   
        this.messageConverter = messageConverter;   
    }   
       
}  
