-- ============================================
-- CRIAR ENUMS
-- ============================================
CREATE TYPE "Role" AS ENUM ('USER', 'ADMIN');
CREATE TYPE "OrderStatus" AS ENUM ('PENDING', 'PAID', 'SHIPPED', 'DELIVERED', 'CANCELLED');

-- ============================================
-- CRIAR TABELA USER
-- ============================================
CREATE TABLE "User" (
  id SERIAL PRIMARY KEY,
  "firstName" VARCHAR(255) NOT NULL,
  "lastName" VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  cpf VARCHAR(11) UNIQUE,
  phone VARCHAR(20),
  "birthDate" TIMESTAMP,
  "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  role "Role" DEFAULT 'USER'
);

-- ============================================
-- CRIAR TABELA CATEGORY
-- ============================================
CREATE TABLE "Category" (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  slug VARCHAR(255) UNIQUE NOT NULL,
  description TEXT,
  active BOOLEAN DEFAULT true,
  "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- CRIAR TABELA PRODUCT
-- ============================================
CREATE TABLE "Product" (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  slug VARCHAR(255) UNIQUE NOT NULL,
  description TEXT,
  price NUMERIC(10, 2) NOT NULL,
  colors JSONB,
  images JSONB,
  sizes JSONB,
  stock INTEGER DEFAULT 0,
  active BOOLEAN DEFAULT true,
  "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "categoryId" INTEGER NOT NULL REFERENCES "Category"(id)
);

-- ============================================
-- CRIAR TABELA ORDER
-- ============================================
CREATE TABLE "Order" (
  id SERIAL PRIMARY KEY,
  "userId" INTEGER REFERENCES "User"(id),
  total NUMERIC(10, 2) NOT NULL,
  status "OrderStatus" DEFAULT 'PENDING',
  "shippingAddress" JSONB NOT NULL,
  "paymentMethod" VARCHAR(255) NOT NULL,
  "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- CRIAR TABELA ORDER_ITEM
-- ============================================
CREATE TABLE "OrderItem" (
  id SERIAL PRIMARY KEY,
  "orderId" INTEGER NOT NULL REFERENCES "Order"(id),
  "productId" INTEGER NOT NULL REFERENCES "Product"(id),
  price NUMERIC(10, 2) NOT NULL,
  quantity INTEGER NOT NULL,
  size VARCHAR(50),
  "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- CRIAR ÍNDICES PARA PERFORMANCE
-- ============================================
CREATE INDEX idx_product_category ON "Product"("categoryId");
CREATE INDEX idx_product_active ON "Product"(active);
CREATE INDEX idx_product_slug ON "Product"(slug);
CREATE INDEX idx_order_user ON "Order"("userId");
CREATE INDEX idx_order_status ON "Order"(status);
CREATE INDEX idx_order_item_order ON "OrderItem"("orderId");
CREATE INDEX idx_order_item_product ON "OrderItem"("productId");
CREATE INDEX idx_category_active ON "Category"(active);
CREATE INDEX idx_category_slug ON "Category"(slug);
