CREATE TABLE write_test
(
  "Row ID" BIGINT
  , "Order Code" BIGINT
  , "Order Date" TIMESTAMP
  , "Order Priority" VARCHAR(200)
  , "Order Quantity" BIGINT
  , Sales NUMERIC(19, 4)
  , Discount NUMERIC(17, 2)
  , "Ship Mode" VARCHAR(200)
  , Profit NUMERIC(17, 2)
  , "Unit Price" NUMERIC(17, 2)
  , "Shipping Cost" NUMERIC(17, 2)
  , "Customer Code" BIGINT
  , "Customer Name" VARCHAR(200)
  , Province VARCHAR(200)
  , Region VARCHAR(200)
  , "Customer Segment" VARCHAR(200)
  , "Product Code" BIGINT
  , "Product Category" VARCHAR(200)
  , "Product Sub-Category" VARCHAR(200)
  , "Product Name" VARCHAR(200)
  , "Product Container" VARCHAR(200)
  , "Product Base Margin" NUMERIC(17, 2)
  , "Ship Date" TIMESTAMP
)
;

CREATE TABLE STG_ORDERS
(
  "Order Code" BIGINT
  , "Order Priority" VARCHAR(200)
)
;

CREATE TABLE STG_PRODUCTS
(
  "Product Code" BIGINT
  , "Product Category" VARCHAR(200)
  , "Product Sub-Category" VARCHAR(200)
  , "Product Name" VARCHAR(200)
  , "Product Container" VARCHAR(200)
)
;

CREATE TABLE STG_CUSTOMERS
(
  "Customer Code" BIGINT
  , "Customer Name" VARCHAR(200)
  , Province VARCHAR(200)
  , Region VARCHAR(200)
  , "Customer Segment" VARCHAR(200)
)
;