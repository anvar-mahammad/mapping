;; Auto-generated. Do not edit!


(when (boundp 'ball_chaser::GoToTarget)
  (if (not (find-package "BALL_CHASER"))
    (make-package "BALL_CHASER"))
  (shadow 'GoToTarget (find-package "BALL_CHASER")))
(unless (find-package "BALL_CHASER::GOTOTARGET")
  (make-package "BALL_CHASER::GOTOTARGET"))
(unless (find-package "BALL_CHASER::GOTOTARGETREQUEST")
  (make-package "BALL_CHASER::GOTOTARGETREQUEST"))
(unless (find-package "BALL_CHASER::GOTOTARGETRESPONSE")
  (make-package "BALL_CHASER::GOTOTARGETRESPONSE"))

(in-package "ROS")





(defclass ball_chaser::GoToTargetRequest
  :super ros::object
  :slots (_linear_x _angular_z ))

(defmethod ball_chaser::GoToTargetRequest
  (:init
   (&key
    ((:linear_x __linear_x) 0.0)
    ((:angular_z __angular_z) 0.0)
    )
   (send-super :init)
   (setq _linear_x (float __linear_x))
   (setq _angular_z (float __angular_z))
   self)
  (:linear_x
   (&optional __linear_x)
   (if __linear_x (setq _linear_x __linear_x)) _linear_x)
  (:angular_z
   (&optional __angular_z)
   (if __angular_z (setq _angular_z __angular_z)) _angular_z)
  (:serialization-length
   ()
   (+
    ;; float64 _linear_x
    8
    ;; float64 _angular_z
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _linear_x
       (sys::poke _linear_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angular_z
       (sys::poke _angular_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _linear_x
     (setq _linear_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angular_z
     (setq _angular_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass ball_chaser::GoToTargetResponse
  :super ros::object
  :slots (_msg_feedback ))

(defmethod ball_chaser::GoToTargetResponse
  (:init
   (&key
    ((:msg_feedback __msg_feedback) "")
    )
   (send-super :init)
   (setq _msg_feedback (string __msg_feedback))
   self)
  (:msg_feedback
   (&optional __msg_feedback)
   (if __msg_feedback (setq _msg_feedback __msg_feedback)) _msg_feedback)
  (:serialization-length
   ()
   (+
    ;; string _msg_feedback
    4 (length _msg_feedback)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _msg_feedback
       (write-long (length _msg_feedback) s) (princ _msg_feedback s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _msg_feedback
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _msg_feedback (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass ball_chaser::GoToTarget
  :super ros::object
  :slots ())

(setf (get ball_chaser::GoToTarget :md5sum-) "c8652349d2a34a90a09475339e2a93d9")
(setf (get ball_chaser::GoToTarget :datatype-) "ball_chaser/GoToTarget")
(setf (get ball_chaser::GoToTarget :request) ball_chaser::GoToTargetRequest)
(setf (get ball_chaser::GoToTarget :response) ball_chaser::GoToTargetResponse)

(defmethod ball_chaser::GoToTargetRequest
  (:response () (instance ball_chaser::GoToTargetResponse :init)))

(setf (get ball_chaser::GoToTargetRequest :md5sum-) "c8652349d2a34a90a09475339e2a93d9")
(setf (get ball_chaser::GoToTargetRequest :datatype-) "ball_chaser/GoToTargetRequest")
(setf (get ball_chaser::GoToTargetRequest :definition-)
      "float64 linear_x
float64 angular_z
---
string msg_feedback
")

(setf (get ball_chaser::GoToTargetResponse :md5sum-) "c8652349d2a34a90a09475339e2a93d9")
(setf (get ball_chaser::GoToTargetResponse :datatype-) "ball_chaser/GoToTargetResponse")
(setf (get ball_chaser::GoToTargetResponse :definition-)
      "float64 linear_x
float64 angular_z
---
string msg_feedback
")



(provide :ball_chaser/GoToTarget "c8652349d2a34a90a09475339e2a93d9")


