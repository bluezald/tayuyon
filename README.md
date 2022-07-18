## NOTICE:
- The project will be refactored to a different branding soon, will be named maybe - "Tayuyon" A cebuano term about sustainability

![Vegan-on-logo](https://raw.githubusercontent.com/bluezald/vegan-on/master/logo.png?token=AAH4T5RGVAHGN2GUQY7GKES62XVYU)
---
a full vegan application system with server side and client side

![Vegan-on idea](https://github.com/bluezald/vegan-on/blob/master/vegan-on.jpg)

# Frontend Consumer
- iOS
### Features
- Browse Recipes
- Browse Tutorials (Cooking or Backyard Farming)
- Browse Sellers

### Technologies
- RxSwift
- SwiftUI
- fastlane tools

# Frontend Admin
- Vuejs
- Typescript
- Bulma
- Deploy in https://www.netlify.com/

# Backend
- NestJS
## REST API
### /products?type=['tutorials', 'goods']
- Methods: GET, POST, PUT, DELETE
- Used in the homepage and discover page when browsing for vegan products
### /stores
- Methods: GET, POST, PUT, DELETE
- Gets the locations of the stores to be displayed in a map view
### /orders

# Infrastructure
- AWS Cognito - User Management
- AWS API Gateway and Lambda - Backend
- AWS S3 - Frontend
- AWS Dynamo DB
