    // Netscape Navigator ab 2.x
    nsc   = (navigator.appName.indexOf('Netscape') != -1)
    // Netscape Navigator 4.x
    nsc4  = (document.layers)

    // Internet Explorer ab 2.x
    ie2    = (navigator.appName.indexOf('Microsoft') != -1)
    // Internet Explorer ab 4.x
    ie4    = (document.all)
    // Netscape Navigator 6.x
    nsc6 = (document.getElementById&&!ie2)

    // Browserversion 4.x
    v4     = navigator.appVersion.substring(0,1) == "4"
    // Browserversion 5.x
    v5     = navigator.appVersion.substring(0,1) == "5"
    // Browserversion 6.x
    v6     = navigator.appVersion.substring(0,1) == "6"

    css=1;

    if(ie4)
    {
      css=2;
    }

    function init()
    {
      opens=get_opens();

      set_img();
    }

    function my_min(v1,v2)
    {
      if(v1<v2)
        return v1;
      else
        return v2;
    }

    function my_strpos(str,search,pos)
    {
      var ok=false;
      var ret="";

      for(i=pos;i<str.length;i++)
      {
        if(str.charAt(i)==search.charAt(0) && !ok)
        {
          ok=true;
          for(j=i;j<i+search.length;j++)
          {
            if(str.charAt(j)!=search.charAt(j-i))
              ok=false;
          }

          if(ok) ret=i;
        }

        if(ok) break;
      }

      return ret;
    }


    var opens="";

    function set_img()
    {
      var nodes=document.getElementsByTagName("img");
      for(var j=0;j<nodes.length;j++)
      {
        if(nodes[j].getAttribute("nodeimg"))
        {
          nodes[j].src=get_oc_img(nodes[j].getAttribute("nodeimg"));

          if(is_oc(nodes[j].getAttribute("nodeimg")))
            nodes[j].style.cursor="pointer";
        }
      }
    }

    function is_oc(id)
    {
      var ret=false;

      var e=document.getElementById(id);
      if(e)
        if(e.innerText)
          ret=true;

      return ret;
    }

    function is_c(id)
    {
      var ret=false;

      var e=document.getElementById(id);
      if(e)
        if(e.style.display=="none")
          ret=true;

      return ret;
    }

    function is_o(id)
    {
      return !is_c(id);
    }

    function get_oc_img(id)
    {
      var ret="nav1_0.gif";

      if(is_oc(id))
      {
        if(is_o(id))
          ret="nav1_auf.gif";
        else if(is_c(id))
          ret="nav1_zu.gif";
      }

      return "images/"+ret;
    }

    function get_opens()
    {
      return "";

      var str=document.cookie+";";

      var pos0=my_strpos(" "+str,"opens=",0);
      var pos2=my_strpos(" "+str,";",pos0);

      if(pos0>0 && pos2>0)
      {
        pos0--; pos2--;
        str=str.substr(pos0+6,pos2-pos0-6);

        var pos1=1;
        var pos2=my_strpos(" "+str,",",0);
        while(pos2>0)
        {
          var kv=str.substr(pos1-1,pos2-pos1);

          var pos3=my_strpos(kv,"-",0);
          var key=kv.substr(0,pos3);
          var value=kv.substr(pos3+1);

          var o=document.getElementById(key);

          if(o)
            o.style.display=value;

          pos1=pos2+1;
          pos2=my_strpos(" "+str,",",pos1);
        }
      }
      else
        str="";

      return str;
    }

    function set_opens(id,value)
    {
      var pos1=my_strpos(" "+opens,id+"-,",0);
      var pos2=my_strpos(" "+opens,id+"-none,",0);

      if(pos1>0)
      {
        pos1--;
        opens=opens.substr(0,pos1)+id+"-"+value+","+opens.substr(pos1+id.length+2);
      }
      else if(pos2>0)
      {
        pos2--;
        opens=opens.substr(0,pos2)+id+"-"+value+","+opens.substr(pos2+id.length+6);
      }
      else
        opens=opens+id+"-"+value+",";
    }

    function oc(id)
    {
      var o=document.getElementById(id);

      if(o)
      {
        var v=o.style.display;

        if(!v)
        {
          o.style.display="none";
          set_opens(id,"none");
        }
        else
        {
          o.style.display="";
          set_opens(id,"");
        }

        var jetzt=new Date();
        var Auszeit=new Date(jetzt.getTime()+1000*60*60*24*365);

        var cookie_str="opens="+opens+"; expires="+Auszeit.toGMTString()+";";
        document.cookie=cookie_str;
      }
    }