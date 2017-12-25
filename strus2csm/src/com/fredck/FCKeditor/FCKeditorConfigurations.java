package com.fredck.FCKeditor;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class FCKeditorConfigurations extends HashMap
{
  public String getUrlParams()
  {
    StringBuffer osParams = new StringBuffer();

    for (Iterator i = entrySet().iterator(); i.hasNext(); ) {
      Map.Entry entry = (Map.Entry)i.next();
      if (entry.getValue() != null)
        osParams.append("&" + encodeConfig(entry.getKey().toString()) + "=" + encodeConfig(entry.getValue().toString()));
    }
    return osParams.toString();
  }

  private String encodeConfig(String txt) {
    txt = txt.replaceAll("&", "%26");
    txt = txt.replaceAll("=", "%3D");
    txt = txt.replaceAll("\"", "%22");
    return txt;
  }
}