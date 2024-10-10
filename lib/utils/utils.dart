
const hoursInMs = 1000 * 60 * 60;
const minuteInMs = 60000;
const secondInMs = 1000;

String getFormattedTimer(double remainingTime) {
  print(remainingTime);
  var remainingMs = remainingTime * 1000;
  
  var hours = (remainingMs / hoursInMs).floor(); // Give remaining hours
  remainingMs -= hours * hoursInMs; // Subtract hours
  var minutes = (remainingMs / minuteInMs).floor(); // Give remaining minutes
  remainingMs -= minutes * minuteInMs; // Subtract minutes
  var seconds = (remainingMs / secondInMs).floor(); // Give remaining seconds
  
  var formattedMinutes = getFormattedTime(minutes);
  var formattedSeconds = getFormattedTime(seconds);

  return "$formattedMinutes:$formattedSeconds";
}

String getFormattedTime(int time) {
  return time < 10 ? "0$time" : time.toString(); 
}