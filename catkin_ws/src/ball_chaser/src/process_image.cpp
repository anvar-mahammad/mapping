#include "ros/ros.h"
#include "ball_chaser/DriveToTarget.h"
#include <sensor_msgs/Image.h>
#include <ros/console.h>
using namespace std;

ros::ServiceClient client;

void drive_robot(float lin_x, float ang_z) 
{
  ROS_INFO_STREAM("Moving the robot");
  
  ball_chaser::DriveToTarget srv;
  srv.request.linear_x = lin_x;
  srv.request.angular_z = ang_z;
  client.call(srv);
}

void stop_robot()
{
   ball_chaser::DriveToTarget srv;
   srv.request.linear_x = 0;
   srv.request.angular_z = 0;
   client.call(srv); 
}
void process_image_callback(const sensor_msgs::Image img)
{
  int white_pixel = 255;
  
  int height = img.height;
  int width = img.width;
  int ball_edge;
  int ball_center;
  int ball_total = 0;
  int white_pixel_total = 0;
  
  //ROS_INFO_STREAM(to_string(height) + " and " + to_string(width));
  bool detect_left = false;
  bool detect_right = false;
  bool detect_center =false;
  bool detect = false;
  
  for(int i = 0; i + 2< img.data.size(); i+=3) {
    //ROS_INFO_STREAM(to_string(img.data[i]));
    if (img.data[i] == white_pixel && img.data[i+1] == white_pixel && img.data[i+2] == white_pixel) {
      ball_edge = (i % (width*3))/3;
      ball_total = ball_total + ball_edge;
      white_pixel_total ++;
      detect = true;
    }
  }  
    
  if (detect == true){
    
    ball_center = ball_total / white_pixel_total;
    
    if (ball_center < width/3){
      detect_left = true;
    }
    else if ( ball_center > width/3 && ball_center < width *(2/3)){
      detect_center = true;
    }
    else if ( ball_center > width *(2/3)){
      detect_right = true;
    }
  }
  
  else {
    stop_robot();
  }
    
 
  
  if(detect_left == true && detect == true){
    drive_robot(0.15,0.15);
  }
  else if (detect_center == true && detect == true){
    drive_robot(0.15,0.0);
  }
  else if (detect_right == true && detect == true){
    drive_robot(0.15,-0.15);
  }
  
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "process_image");
  
  ros::NodeHandle n;
  
  client = n.serviceClient<ball_chaser::DriveToTarget>("/ball_chaser/command_robot");
  
  ros::Subscriber sub1 = n.subscribe("/camera/rgb/image_raw", 10, process_image_callback);
  
  ros::spin();
  
  return 0;
}