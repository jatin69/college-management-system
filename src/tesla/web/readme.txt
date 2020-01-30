TEST POI -- URGENT


t_u_attendance_s.jsp
is awesome

use bean to set path of the file,
then read and extract a List and fetch the required value.



Upload path
D:\5th sem\TESLA - IT project\tesla\web\uploads


Variables -
g_username is global username for current active user


AppExceptionHandler.java
Handles most of the exception pages

ActiveUser.java
is a global session information storing bean

resource_include.jsp 
are normal css, js resources

global_include.jsp
are jstl lines to be included

<filename>_s.jsp 
is a server side page for a normal page <filename>.jsp
eg- 
login       & login_s
logout      & logout_s
register    & register_s

 
s_<filename>.jsp
is a student section files
eg-
s_navigation
s_dashboard
student menu -> dashboard, attendance, result, syllabus, notices, SOLID

a_<filename>.jsp 
is a admin section files
eg-
a_navigation
a_dashboard
admin menu -> dashboard, attendance, result, syllabus, notices, FAST forward

t_<filename>.jsp 
is a teacher section files
eg-
t_navigation
t_dashboard
teacher menu -> dashboard, attendance, result, syllabus, notices, SUBJECTS
t_profile
t_subjects
t_notices
t_syllabus
t_u_notices
t_u_attendances
