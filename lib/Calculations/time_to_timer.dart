
class TimerConfig {
   int differenceInt(DateTime start, DateTime end){
    int minutes = end.difference(start).inMinutes;
    return minutes;
  }
  Duration differenceDuration(DateTime start, DateTime end){
    Duration difference = end.difference(start);
    return difference;
  }
    double percentage(int diffInNowAndEnd ,int diffInStartAndEnd){
     return diffInNowAndEnd/diffInStartAndEnd;
    }
}