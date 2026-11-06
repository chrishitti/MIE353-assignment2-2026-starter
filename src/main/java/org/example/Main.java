package org.example;

// General Helper Imports
import manifold.sql.rt.api.Dependencies.*;
import java.sql.SQLException;
import java.util.List;
import static java.lang.System.out;
import java.nio.file.*;


// Import all defined queries
import org.example.queries.*;

// Import schema classes
import org.example.schema.CMS;
import org.example.schema.CMS.*;



public class Main {
    public static void main(String[] args) {

      try {
        // Load in all the data from CSV files in to in-memory DuckDB
        loadCMSData();

        // Example: fetch a student by ID and print their email
        Student s = Student.fetch(9002);
        out.println(s.getEmail());
        // Example: fetch the same student using a parameterized SQL query
        Student s2 = FindStudent.fetchOne(9002);
        out.println(s2.getEmail());

        //Example: saving a table to CSV
        CMS.addSqlChange(ctx -> {
          SaveStudrts.execute(ctx);
        });
        CMS.commit();
        
        // EXTRA MAIN FUNCTION CALLS CAN GO BELOW:

        saveGradCourses();
        query1();
        query2();
        query3();
        query4();
        query5();
        query6();
        query7();
        query8();

        
      }
      catch (Exception e) {
        e.printStackTrace();
      }


  }

  public static void loadCMSData() throws SQLException {
    loadStudentData();
    loadProfessorData();
    loadCourseData();
    loadTranscriptData();
    loadTeachesData(); // ADDED FOR PART 2
  }

  public static void loadStudentData() throws SQLException {
    CMS.addSqlChange(ctx -> {
      LoadStudents.execute(ctx);
    });
    CMS.commit();
  }

  public static void loadProfessorData() throws SQLException {
    CMS.addSqlChange(ctx -> {
      LoadProfessors.execute(ctx);
    });
    CMS.commit();
  }

  public static void loadCourseData() throws SQLException {
    CMS.addSqlChange(ctx -> {
      LoadCourses.execute(ctx);
    });
    CMS.commit();
  }

  public static void loadTranscriptData() throws SQLException {
    CMS.addSqlChange(ctx -> {
      LoadTranscript.execute(ctx);
    });
    CMS.commit();
  }

  // NEW METHOD FOR PART 2 BELOW (AND NEWLY CREATED .SQL FILE)
  public static void loadTeachesData() throws SQLException {
    CMS.addSqlChange(ctx -> {
      LoadTeaches.execute(ctx);
    });
    CMS.commit();
  }

  //PART 3 METHOD DEFINITION
  public static void saveGradCourses() throws SQLException {
    CMS.addSqlChange(ctx -> {
        SaveGradCourses.execute(ctx);
    });
    CMS.commit();
}


  //run each query in SQL and save its header and rows to CSV
  public static void query1() throws SQLException {
    CMS.addSqlChange(ctx -> {
      SaveQuery1.execute(ctx);
    });
    CMS.commit();
  }
  public static void query2() throws SQLException {
    CMS.addSqlChange(ctx -> {
      SaveQuery2.execute(ctx);
    });
    CMS.commit();
  }
  public static void query3() throws SQLException {
    CMS.addSqlChange(ctx -> {
      SaveQuery3.execute(ctx);
    });
    CMS.commit();
  }
  public static void query4() throws SQLException {
    CMS.addSqlChange(ctx -> {
      SaveQuery4.execute(ctx);
    });
    CMS.commit();
  }
  public static void query5() throws SQLException {
    CMS.addSqlChange(ctx -> {
      SaveQuery5.execute(ctx);
    });
    CMS.commit();
  }
  public static void query6() throws SQLException {
    CMS.addSqlChange(ctx -> {
      SaveQuery6.execute(ctx);
    });
    CMS.commit();
  }
  public static void query7() throws SQLException {
    CMS.addSqlChange(ctx -> {
      SaveQuery7.execute(ctx);
    });
    CMS.commit();
  }
  public static void query8() throws SQLException {
    CMS.addSqlChange(ctx -> {
      SaveQuery8.execute(ctx);
    });
    CMS.commit();
  }
}