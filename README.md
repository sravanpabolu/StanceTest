# Stance Test 

## Tools 
    - XCode 13.3, Since I have older mac 2015 model, running Mac OS Monterey (Version 12.7.6) 
    - Min deployment target - 15.4
    - Swift version - 5.0

## Build and Run Instructions
    - Clone the repository
    - Open the project in Xcode:
    - Install dependencies (via Swift Package Manager) when prompted by Xcode.
    - Build and run the project on a device or simulator.

## Tech Notes / Enhancements /Upgrades
    - Added external package SwiftUICharts as a dependency to display graph, as Swift Charts is not supported in iOS 15.x
    - NavigationView can be replaced with NavigationStack. I haven't used it because of older XCode
    - Constants file can be used to store all the string constants
    - Unit tests can be added for Services and ViewModels.  
    - Improve UX/UI designs, like adding animations  
    - Errors can be handled in a different way with better user experience.
    - Image Caching to reduce network usage
    - UITests can be added 
    - Pull to refresh can be added to refresh session data
    
## Implementation Summary
- **SwiftUI**: The app is built entirely using SwiftUI.
- **SwiftUICharts**: SwiftUICharts, an external library, was used to display the speed vs. reps graph due to its ease of integration and flexibility.
- **Networking**: `URLSession` was used for fetching session data, parsed using `Codable`.
    
## Time Spent
Approximate time spent: 2-2.5 hours.
