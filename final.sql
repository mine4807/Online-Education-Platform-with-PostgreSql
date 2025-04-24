
CREATE TABLE members
(
	
    member_id BIGSERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_ VARCHAR(255) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);
--select * from members;


CREATE TABLE courses
(
	
    course_id BIGSERIAL PRIMARY KEY,
    coursename VARCHAR(200) UNIQUE NOT NULL,
    explanation TEXT,
    start_date DATE,
	finish_date DATE,
    instructor_name VARCHAR(100) NOT NULL
);
--select * from courses;



CREATE TABLE categories (
    category_id SMALLINT PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL
);
--select * from categories;

ALTER TABLE courses
ADD COLUMN category_id SMALLINT,
ADD CONSTRAINT fk_category
FOREIGN KEY (category_id) REFERENCES categories(category_id);

--select * from courses;

CREATE TABLE enrollments (
    enrollment_id BIGSERIAL PRIMARY KEY,
    member_id BIGINT NOT NULL,
    course_id BIGINT NOT NULL,
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_member
        FOREIGN KEY (member_id) REFERENCES members(member_id)
        ON DELETE CASCADE,  -- herhangi bir kullnıcı silinirse ilgili kayıtları silmek için
        
    CONSTRAINT fk_course
        FOREIGN KEY (course_id) REFERENCES courses(course_id)
        ON DELETE CASCADE,  -- herhangi bir kurs silinirse ilgili kayıtları silmek için
        
    CONSTRAINT uc_member_course
        UNIQUE (member_id, course_id) -- aynı kullanıcının aynı kursa tekrar tekrar katılmasını önlemek için
);

--select * from enrollments;

CREATE TABLE certificates (
    certificate_id BIGSERIAL PRIMARY KEY,
    enrollment_id BIGINT NOT NULL,
    certificate_code VARCHAR(100) UNIQUE NOT NULL,
    issue_date DATE DEFAULT CURRENT_DATE,
    
    CONSTRAINT fk_enrollment
        FOREIGN KEY (enrollment_id) REFERENCES enrollments(enrollment_id)
        ON DELETE CASCADE
);
CREATE TABLE certificate_assignments (
    assignment_id BIGSERIAL PRIMARY KEY,
    member_id BIGINT NOT NULL,
    certificate_id BIGINT NOT NULL,
    assigned_date DATE DEFAULT CURRENT_DATE,
    
    CONSTRAINT fk_member_certificate
        FOREIGN KEY (member_id) REFERENCES members(member_id)
        ON DELETE CASCADE,
        
    CONSTRAINT fk_certificate
        FOREIGN KEY (certificate_id) REFERENCES certificates(certificate_id)
        ON DELETE CASCADE,
        
    CONSTRAINT uc_member_certificate
        UNIQUE (member_id, certificate_id) -- Aynı kullanıcıya aynı sertifika birden fazla atanamaz
);


CREATE TABLE blog_posts (
    post_id BIGSERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    published_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    author_id BIGINT NOT NULL,
    
    CONSTRAINT fk_author
        FOREIGN KEY (author_id) REFERENCES members(member_id)
        ON DELETE CASCADE
);



