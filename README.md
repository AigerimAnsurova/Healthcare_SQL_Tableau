##	Problem Statement
Hospital is a very important facility for a person as it helps people saving lives. Managing hospital is a huge task and there should be an accurate system in place to organize and manage the day to day tasks in a hospital. 
One of the major and most important task is to manage patients, their appointments in correspondence to schedules of doctors and their medical history in order for correct and accurate treatment required. Hence, a very well organized database schema is required for this. In this assignment we have tried to relate a schema for doctors working in a hospital with the patients visiting them. The schema also includes a relationship between the patient and their medical history.

##	ER Diagram
<img width="452" alt="image" src="https://github.com/AigerimAnsurova/Hospital-Management-/assets/93296386/6c65e9de-08db-4ee6-bb73-96adf9f50dc2">

The above ER diagram shows the relationship between all the entities in the database designed. Entity patient is majorly related to two other entities i.e. medical history and appointment. A patient is always required to fill his/her medical history and can have more than one medical histories so it is a one to many relation. As well as the patient has to follow his/her appointments or book them. A patient at a time can have only one appointment hence this being a one to one relation. 
Another main entity in the schema is Doctor. A doctor follows a schedule and hence is related to an entity schedule on a one to one basis. Schedule is further related to entity appointment as an appointment of a patient depends on the schedule of the doctor. A doctor needs to view the medical history of a patient and hence is related to medical history on one to many basis. Doctor also receive a pay check and hence is related to pay check table on one to one basis.

## Schema

<img width="452" alt="image" src="https://github.com/AigerimAnsurova/Hospital-Management-/assets/93296386/71d4663c-8a98-4a0e-a435-2d97ed47e861">


