Feature: Book category

  Background: I should be able to see homepage
    Given I enter URL "https://demo.nopcommerce.com/" in browser
    And   I am on home page

    Scenario Outline: I should be able to see top menu tabs on homepage with categories
      When I am on home page
      Then I should be able to see menu tabs with "<categories>"
      Examples:
      | categories         |
      | computer           |
      | Electronic         |
      | Apparel            |
      | Digital downloads  |
      | Books              |
      | jewellery          |
      | Gift card          |

      Scenario Outline:  I should be able to see book page with filters
        When I select book category from top menu tabs on home page
        Then I should ne navigated to book category
        And  I should be able to see "<filters>"
        Examples:
        |filters    |
        |Short by   |
        |Display    |
        |the Grid   |
        |List Tab   |

        Scenario Outline: I should be able to see list of terms of each filter
          Given I am on book page
          When  I click on "<filter>"
          Then  I should be able to see "<list>" in dropdown menu
          Examples:
          |filter  | list                                                                           |
          |sort by | Name: A to Z, name: Z to A, Price: Low to High, Price: High to Low, Created on |
          |Display | 3,6,9                                                                          |

          Scenario Outline: I should be able to choose any filter option with specific result
            Given I am on book page
            When  I click on "<filter>"
            And   I click on any "<option>"
            Then  I should be able to choose any filter option from the list
            And   I shour be able to see "<result>"
            Examples:
            |filter  | option              | results                                                          |
            |Sort by | Name A to Z         | sorted product with the product name in alphabetical order A to Z|
            |Sort by | Name Z to A         | sorted product with the product name in alphabetical order Z to A |
            |Sort by | Price: low to high  |sorted product with the price in descending order                 |
            |Sort by | Price: high to low  |sorted product with the price in ascending order                  |
            |sort by | Created on          | Recently added product should be show first                      |
            |Display | 3                   | 3 products in page                                               |
            |Display | 6                   | 6 products in page                                               |
            |Display | 9                   | 9 products in page                                               |

            Scenario Outline: I should be able to see product display format accordingly display format type as per given picture in srs document
              Given I am on book page
              When  I click on "< display format icon>"
              Then  I should be able to see product display format according display format type as per given picture in srs documnet
              Examples:
              | display format icon |
              | Grid                |
              | List                |