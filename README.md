
# Demo



# Requirements:
### Functional
  - Authenticate Users.
  - Listing Home Data.
  - Fetching Different Categories Data.
  - User Cart Management.
  - User Wishlist
  - Browsing Full Product Details
      
### Non-Functional:
- Scalability:
  - Modularity.
- Performance:
  - Caching Wishlist.
- Reliability:
  - Unit tests(Soon).
 
# Diagrams

    
- Low-Level Diagram - Simplified clean architecture
  ![Simplified clean architecture](![Screenshot 2024-09-27 at 2 21 41 PM](https://github.com/user-attachments/assets/d985a0d3-7476-445d-aa63-0f55519423a1))




# Decisions

- Firebase Auth Rest API for handling Authentication
    
- Framework:
  - Google's Flutter

- Principals and Patterns:
  - SOLID conformance:
    - The app is separated into features.
    - Injection Container to create each module.
    - Repository for formatting backend data.
    - Event Bus pattern to manage communication among modules.
    - BLoC for business logic and state management.


  
 

   
# What could be improved
- Be more secure and include the API keys in the keychain and secure storage or external tool.
- Splitting the logic in use cases if needed.
- Unit testing for the features.
- Caching for handling offline state.
- CI/CD
