#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
#include "ball_chaser/DriveToTarget.h"
using namespace std;
ros::Publisher motor_commands_publisher;

bool handle_drive_request(ball_chaser::DriveToTarget::Request& req, ball_chaser::DriveToTarget::Response& res)
{
  //notify that command received
  ROS_INFO_STREAM("DriveToTarget Received");
  
  //publish the velocities
  geometry_msgs::Twist motor_speed;
  motor_speed.linear.x = req.linear_x;
  motor_speed.angular.z = req.angular_z;
  
  motor_commands_publisher.publish(motor_speed);

  
  res.msg_feedback = "Velocities are set to linear_x: "+ to_string((double)motor_speed.linear.x) + ", angular_z: " + to_string((double)motor_speed.angular.z);
  
  ROS_INFO_STREAM(res.msg_feedback);
  
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "drive_bot");
  
  ros::NodeHandle n;
  
  motor_commands_publisher = n.advertise<geometry_msgs::Twist>("/cmd_vel",10);
    
  ros::ServiceServer service = n.advertiseService("/ball_chaser/command_robot", handle_drive_request);
  
  ros::spin();
  
  return 0;
}