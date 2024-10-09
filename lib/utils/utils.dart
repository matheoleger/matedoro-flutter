import 'dart:async';

typedef PeriodicCallBack = void Function(Timer periodicTime);

void handleTimer(int time) {

  click(Timer periodicTime) {
    print(periodicTime.tick);
    if(periodicTime.tick == 0) {
      clearInterval(periodicTime);
    }
  }
  
  var period = setInterval(click, time);
}

Timer setInterval(PeriodicCallBack click, time) {
  Duration periodic = Duration(milliseconds: time);
  var period = Timer.periodic(periodic, (intervalTime) {
    click(intervalTime);
  });

  return period;
}

void clearInterval(Timer timer) {
  timer.cancel();
}