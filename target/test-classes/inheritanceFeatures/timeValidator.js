// You can change the time formate in the variable sdf add .ms if the response have milliseconds
function fn(s) {
    var SimpleDateFormat = Java.type("java.text.SimpleDateFormat");
    var sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.ms'Z'");
    try {
      sdf.parse(s).time;
      return true;
    } catch(e) {
      karate.log('*** invalid date string:', s);
      return false;
    }
  }