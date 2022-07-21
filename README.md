
# Tayuyon
- a full sustainability lifestyle application system with server side and client side (Starting on iOS version)

## Requirements

![Vegan-on idea](https://github.com/bluezald/vegan-on/blob/master/vegan-on.jpg)

- Get access to data similar from here: https://sustainability.ph/solutions/sustainable

# Figma:
https://www.figma.com/file/7wXpjt0YiKawtiiFN72qHX/Grocery-App-%F0%9F%A5%A6-(Community)?node-id=102%3A49

---

## Frontend Consumer
- iOS
### Features:
- Browse Recipes
- Browse Tutorials (Cooking or Backyard Farming)
- Browse Sellers

### Technologies
- RxSwift
- SwiftUI
- fastlane tools

## Frontend Admin
- Vuejs
- Typescript
- Bulma
- Deploy in https://www.netlify.com/

## Backend
- NestJS
## REST API
### /products?type=['tutorials', 'goods']
- Methods: GET, POST, PUT, DELETE
- Used in the homepage and discover page when browsing for vegan products
### /stores
- Methods: GET, POST, PUT, DELETE
- Gets the locations of the stores to be displayed in a map view
### /orders

## Infrastructure
- AWS Cognito - User Management
- AWS API Gateway and Lambda - Backend
- AWS S3 - Frontend
- AWS Dynamo DB
