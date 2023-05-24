
# Parishioners Database Management App

The **Parishioners Database Management App** is a minimalistic Ruby on Rails web application designed to efficiently administer and organize the parishioners' database for Catholic parishes in Poland. With a focus on simplicity and functionality, the app provides a seamless user experience for parish administrators.

## Key Features

-   **Hand-Written Authentication System**: The app implements a secure authentication system where each user represents a distinct parish. This ensures data privacy and access control for each parish's database.
    
-   **One User per Parish**: The app is designed to cater to one parish per user, providing a dedicated environment for each parish's specific needs.
    
-   **Street and Number Management**: Administrators can easily add streets and assign numbers (place/flat/house/address) to them. This ensures accurate and detailed record-keeping of the parishioners' addresses.
    
-   **Tenant Management**: The app allows administrators to manage tenants associated with each number. Multiple tenants can be assigned to a single number, and their information can be easily updated and tracked.
    
-   **Service Provision**: Parishioners can receive services provided by ministers. The app facilitates the management and coordination of services offered by ministers to the tenants.
    
-   **Tagging and Statistical Analysis**: Places within the app can be tagged, allowing for easy categorization and organization. The app provides basic statistical analysis, enabling administrators to gain insights into the distribution of tags across the parishioners' database.
    
-   **Pagination and Search**: Each model within the app incorporates pagination and search functionality, providing administrators with convenient navigation and efficient data retrieval capabilities.
    

## Ruby Tricks

The Parishioners Database Management App utilizes a few Ruby tricks to enhance its functionality:

-   **Smart Addressing**: The app employs a smart addressing technique that combines street and number to determine the next or previous address/place. Additionally, leading zeros are added to numbers in addresses for proper sequencing. For example, 1/1 is recorded as 001/001.

-   **Age Calculation**: The app incorporates an age calculation feature based on birth dates. By subtracting the birth date from the current date, the app automatically calculates the age in years. This functionality is also applicable in cases of death, where the app can display the age at the time of passing.

## Technology Stack

The app is built using the following technologies and gems:

-   Ruby on Rails
-   SQLite
-   Bootstrap
-   jQuery
-   Sass
-   bcrypt
-   will_paginate
-   ransack
-   faker
-   haml-rails
-   bootstrap-select-rails

## Contributing

Contributions to the Parishioners Database Management App are welcome! If you encounter any issues or have suggestions for improvement, please open an issue on the [GitHub repository](https://github.com/Kulczyk/parishdb/issues).

## License

The Parishioners Database Management App is released under the [MIT License](https://chat.openai.com/LICENSE).

## Contact

If you have any questions or inquiries, feel free to contact the project maintainer at [bkulczyk83@gmail.com](mailto:bkulczyk83@gmail.com).

Thank you for using the Parishioners Database Management App! We hope it simplifies and enhances your parish administration experience