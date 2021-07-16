CREATE TABLE student
(
    Student_ID INT PRIMARY KEY,
    First_Name VARCHAR(80) NOT NULL,
    Middle_Name VARCHAR(80) NOT NULL,
    Last_Name VARCHAR(80) NOT NULL,
    Gender VARCHAR(1) NOT NULL,
    Email_address VARCHAR(40) NOT NULL UNIQUE,
    Student_qualification VARCHAR(10) NOT NULL,
    Student_documents VARCHAR(255) NOT NULL,
    Student_image VARCHAR(100) NOT NULL,
    Student_mobile VARCHAR(10) NOT NULL,

);
CREATE TABLE questions_in_exam (
    Exam_ID INT UNIQUE,
    ques_id INT UNIQUE,
    PRIMARY KEY(Exam_ID,ques_id),
    FOREIGN KEY (Exam_ID) REFERENCES student_answer(Exam_ID) ON DELETE CASCADE
    
)

CREATE TABLE student_answer
(
    Student_answer_ID INT PRIMARY KEY,
    Student_ID INT PRIMARY KEY,
    Exam_ID INT NOT NULL,
    Question_ID INT NOT NULL,
    feedback VARCHAR(200) NOT NULL,
    student_answer_text VARCHAR(255),
    PRIMARY KEY(Student_ID,Exam_ID),
    FOREIGN KEY (Student_ID) REFERENCES student(Student_Id) ON DELETE CASCADE


);

CREATE TABLE online_exam
(
    exam_ID INT PRIMARY KEY,
    subject_code VARCHAR(15) NOT NULL,
    exam_date INT NOT NULL,
    exam_name VARCHAR(255) NOT NULL,
    total_questions INT NOT NULL,
    marks_per_right_answer INT NOT NULL,
    marks_per_wrong_answer INT NOT NULL,
    passing_marks INT NOT NULL,
    
);


CREATE TABLE exam_subjects
(
    sub_id INT UNIQUE,
    exam_id INT UNIQUE,
    sub_name VARCHAR(20) NOT NULL,
    sub_desc VARCHAR(20) NOT NULL,
    PRIMARY KEY(sub_id,exam_id),
    FOREIGN KEY (exam_id) REFERENCES online_exam(exam_id) ON DELETE CASCADE

);
CREATE TABLE Ref_type_of_question 
(
    Type_of_question_code INT PRIMARY KEY,

)


CREATE TABLE questions
(
    ques_id INT PRIMARY KEY,
    ques_text VARCHAR(150) NOT NULL,
    Type_of_question_code INT PRIMARY KEY,
    ques_attachments VARCHAR(255),
    option_1 VARCHAR(20) NOT NULL,
    option_2 VARCHAR(20) NOT NULL,
    option_3 VARCHAR(20) NOT NULL,
    option_4 VARCHAR(20) NOT NULL,
);


CREATE TABLE valid_answers
(
    valid_answer_id INT PRIMARY KEY,
    ques_id INT UNIQUE,
    ans VARCHAR(20) NOT NULL,
    PRIMARY KEY (valid_answer_id,ques_id),
    FOREIGN KEY (ques_id) REFERENCES valid_answers(valid_answer_id) ON DELETE CASCADE

);



CREATE TABLE subject_assessment
(
    Student_answer_ID INT UNIQUE,
    valid_answer_id INT UNIQUE,
    student_answer_text VARCHAR(255),
    satisfied_YN CHAR(1) NOT NULL,
    assessment VARCHAR(40),
    PRIMARY KEY(Student_answer_ID,valid_answers_id),
    FOREIGN KEY (Student_answer_ID) REFERENCES valid_answers(valid_answer_id) ON DELETE CASCADE,

);

CREATE TABLE exam_result
(
    Student_ID INT,
    exam_id INT,
    sub_id INT,
    marks_scored INT NOT NULL,
    correct_ques INT NOT NULL,
    wrong_ques INT NOT NULL,
    grade VARCHAR(10) NOT NULL,
    attempt_date_time TIMESTAMP NOT NULL,
    PRIMARY KEY(Student_Id,exam_id,sub_id),
    FOREIGN KEY (Student_ID) REFERENCES student(Student_Id) ON DELETE CASCADE,
    FOREIGN KEY (exam_id) REFERENCES online_exam(exam_id) ON DELETE CASCADE,
    FOREIGN KEY (sub_id) REFERENCES  exam_subjects(sub_id) ON DELETE CASCADE


);
CREATE TABLE admin
(
    admin_id INT PRIMARY KEY,
    admin_email_address VARCHAR(50) NOT NULL,
    admin_password VARCHAR(12) NOT NULL,
    admin_type VARCHAR(10) NOT NULL,
    admin_created_on DATE NOT NULL
);