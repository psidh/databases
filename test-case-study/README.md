# Database Schema and Procedures for Disease Management

## Overview
This SQL script defines a simple database schema for managing diseases and doctors, along with a procedure to update disease descriptions. It includes tables for storing disease and doctor information, a view to associate doctors with diseases, and a stored procedure to update disease descriptions.

## Tables

### 1. `Disease`
Stores information about different diseases.

- `s_id` (INT): Primary key for disease ID.
- `s_name` (VARCHAR(100)): Name of the disease.
- `s_description` (VARCHAR(100)): Description of the disease.

### 2. `Doctors`
Stores information about doctors and their specializations.

- `d_id` (INT): Primary key for doctor ID.
- `d_name` (VARCHAR(100)): Name of the doctor.
- `specialization` (VARCHAR(100)): Specialization of the doctor.
- `contact_info` (INT): Contact information of the doctor.

## View

### `Doctor_specialise_disease`
This view shows the doctors who specialize in different diseases by joining the `Disease` and `Doctors` tables on the doctor's specialization and disease name.

#### Columns:
- `d_id`: Doctor ID
- `d_name`: Doctor's name
- `specialization`: Doctor's specialization
- `contact_info`: Doctor's contact number

The following query retrieves the view:

```sql
SELECT * FROM Doctor_specialise_disease;
```

## Stored Procedure

### `Update_Description`
This procedure updates the description of a disease based on its ID.

#### Parameters:
- `p_sid` (IN NUMBER): The ID of the disease to update.
- `p_s_description` (IN VARCHAR2): The new description to set for the disease.

#### Example:

```sql
BEGIN
    -- Call the procedure and pass the parameters
    Update_Description(2, 'New description for disease ID 2');
END;
/
```

## Usage

### Viewing Doctors Specialized in Diseases:
You can view the list of doctors who specialize in the diseases by running the following query:

### Updating Disease Description:
You can update the description of a disease using the `Update_Description` procedure. For example:

After calling the procedure, you can check the updated description by querying the `Disease` table:
## Notes
- The `Disease` table stores various disease records along with a brief description.
- The `Doctors` table stores doctor details, including their specialization and contact info.
- The `Doctor_specialise_disease` view helps to map doctors to diseases based on their specialization.
- The `Update_Description` procedure allows for updating the disease descriptions in the `Disease` table.

## Conclusion
This database schema efficiently manages disease and doctor information. It provides easy retrieval of doctor specialization and updates disease descriptions through the stored procedure.
