-- ============================================
-- INSERIR USUÁRIOS
-- ============================================
INSERT INTO "User" (
  "firstName", "lastName", email, password, cpf, phone, "birthDate", "createdAt", role
) VALUES 
  ('João', 'Silva', 'joao@example.com', '$2b$10$K7L1OJ45/4Y2nIvhRVpCe.FPM0xLqc8y8eMONLr9xOhQ1lUPXIEki', '12345678901', '11999999999', NULL, NOW(), 'USER'),
  ('Maria', 'Santos', 'maria@example.com', '$2b$10$K7L1OJ45/4Y2nIvhRVpCe.FPM0xLqc8y8eMONLr9xOhQ1lUPXIEki', NULL, '11988888888', NULL, NOW(), 'USER'),
  ('Admin', 'System', 'admin@example.com', '$2b$10$K7L1OJ45/4Y2nIvhRVpCe.FPM0xLqc8y8eMONLr9xOhQ1lUPXIEki', NULL, NULL, NULL, NOW(), 'ADMIN');

-- ============================================
-- INSERIR CATEGORIAS
-- ============================================
INSERT INTO "Category" (name, slug, description, active, "createdAt", "updatedAt") VALUES
  ('Camisetas', 'camisetas', 'Camisetas casuais e confortáveis para o dia a dia', true, NOW(), NOW()),
  ('Moletons', 'moletons', 'Moletons quentes e estilosos', true, NOW(), NOW()),
  ('Calças', 'calcas', 'Calças e jeans para todas as ocasiões', true, NOW(), NOW()),
  ('Shorts', 'shorts', 'Shorts esportivos e casuais', true, NOW(), NOW()),
  ('Acessórios', 'acessorios', 'Cintos, bonés, mochilas e mais', true, NOW(), NOW()),
  ('Vestidos', 'vestidos', 'Vestidos para diversas ocasiões', true, NOW(), NOW()),
  ('Calçados', 'calcados', 'Tênis, sapatos e sandálias', true, NOW(), NOW()),
  ('Meias', 'meias', 'Meias confortáveis em diversos estilos', true, NOW(), NOW());

-- ============================================
-- INSERIR PRODUTOS (10 produtos)
-- ============================================
INSERT INTO "Product" (name, slug, description, price, colors, images, sizes, stock, active, "createdAt", "updatedAt", "categoryId") VALUES
  (
    'Classic Tee',
    'classic-tee',
    'Camiseta clássica, confortável e versátil.',
    29.99,
    '["Black", "White"]'::jsonb,
    '["https://placehold.co/600x400?text=classic-tee+1", "https://placehold.co/600x400?text=classic-tee+2"]'::jsonb,
    '["S", "M", "L"]'::jsonb,
    120,
    true,
    NOW(),
    NOW(),
    (SELECT id FROM "Category" WHERE slug = 'camisetas')
  ),
  (
    'Vintage Hoodie',
    'vintage-hoodie',
    'Moletom estilo vintage com caimento oversized.',
    59.90,
    '["Gray", "Navy"]'::jsonb,
    '["https://placehold.co/600x400?text=vintage-hoodie+1"]'::jsonb,
    '["M", "L", "XL"]'::jsonb,
    60,
    true,
    NOW(),
    NOW(),
    (SELECT id FROM "Category" WHERE slug = 'moletons')
  ),
  (
    'Slim Jeans',
    'slim-jeans',
    'Jeans slim fit, tecido stretch para maior conforto.',
    79.50,
    '["Blue"]'::jsonb,
    '["https://placehold.co/600x400?text=slim-jeans+1"]'::jsonb,
    '["30", "32", "34", "36"]'::jsonb,
    40,
    true,
    NOW(),
    NOW(),
    (SELECT id FROM "Category" WHERE slug = 'calcas')
  ),
  (
    'Sport Shorts',
    'sport-shorts',
    'Shorts esportivo, ideal para treinos.',
    24.00,
    '["Black", "Green"]'::jsonb,
    '["https://placehold.co/600x400?text=sport-shorts+1"]'::jsonb,
    '["S", "M", "L"]'::jsonb,
    200,
    true,
    NOW(),
    NOW(),
    (SELECT id FROM "Category" WHERE slug = 'shorts')
  ),
  (
    'Leather Belt',
    'leather-belt',
    'Cinto de couro legítimo com fivela metálica.',
    19.99,
    '["Brown", "Black"]'::jsonb,
    '["https://placehold.co/600x400?text=leather-belt+1"]'::jsonb,
    '["M", "L"]'::jsonb,
    80,
    true,
    NOW(),
    NOW(),
    (SELECT id FROM "Category" WHERE slug = 'acessorios')
  ),
  (
    'Summer Dress',
    'summer-dress',
    'Vestido leve para dias quentes.',
    49.00,
    '["Yellow", "White"]'::jsonb,
    '["https://placehold.co/600x400?text=summer-dress+1"]'::jsonb,
    '["S", "M", "L"]'::jsonb,
    30,
    true,
    NOW(),
    NOW(),
    (SELECT id FROM "Category" WHERE slug = 'vestidos')
  ),
  (
    'Running Shoes',
    'running-shoes',
    'Tênis de corrida com amortecimento avançado.',
    119.99,
    '["Black", "Red"]'::jsonb,
    '["https://placehold.co/600x400?text=running-shoes+1"]'::jsonb,
    '["40", "41", "42", "43"]'::jsonb,
    75,
    true,
    NOW(),
    NOW(),
    (SELECT id FROM "Category" WHERE slug = 'calcados')
  ),
  (
    'Beanie Cap',
    'beanie-cap',
    'Gorro em malha, estilo urbano.',
    12.50,
    '["Black", "Gray"]'::jsonb,
    '["https://placehold.co/600x400?text=beanie-cap+1"]'::jsonb,
    '[]'::jsonb,
    150,
    true,
    NOW(),
    NOW(),
    (SELECT id FROM "Category" WHERE slug = 'acessorios')
  ),
  (
    'Canvas Backpack',
    'canvas-backpack',
    'Mochila de lona com múltiplos compartimentos.',
    69.00,
    '["Olive", "Black"]'::jsonb,
    '["https://placehold.co/600x400?text=canvas-backpack+1"]'::jsonb,
    '[]'::jsonb,
    45,
    true,
    NOW(),
    NOW(),
    (SELECT id FROM "Category" WHERE slug = 'acessorios')
  ),
  (
    'Striped Socks',
    'striped-socks',
    'Meias listradas em algodão macio.',
    6.99,
    '["White", "Blue"]'::jsonb,
    '["https://placehold.co/600x400?text=striped-socks+1"]'::jsonb,
    '["One Size"]'::jsonb,
    300,
    true,
    NOW(),
    NOW(),
    (SELECT id FROM "Category" WHERE slug = 'meias')
  );

-- ============================================
-- INSERIR PEDIDOS
-- ============================================
-- Order 1 - João Silva (PAID)
INSERT INTO "Order" (
  "userId", total, status, "shippingAddress", "paymentMethod", "createdAt", "updatedAt"
) VALUES (
  (SELECT id FROM "User" WHERE email = 'joao@example.com'),
  109.98,
  'PAID',
  '{"cep": "01310100", "street": "Av. Paulista", "number": "1578", "complement": "Apto 101", "neighborhood": "Bela Vista", "city": "São Paulo", "state": "SP", "country": "BR"}'::jsonb,
  'credit_card',
  NOW(),
  NOW()
);

-- Order 2 - Maria Santos (SHIPPED)
INSERT INTO "Order" (
  "userId", total, status, "shippingAddress", "paymentMethod", "createdAt", "updatedAt"
) VALUES (
  (SELECT id FROM "User" WHERE email = 'maria@example.com'),
  229.89,
  'SHIPPED',
  '{"cep": "20040020", "street": "Av. Rio Branco", "number": "156", "neighborhood": "Centro", "city": "Rio de Janeiro", "state": "RJ", "country": "BR"}'::jsonb,
  'pix',
  NOW(),
  NOW()
);

-- Order 3 - João Silva (PENDING)
INSERT INTO "Order" (
  "userId", total, status, "shippingAddress", "paymentMethod", "createdAt", "updatedAt"
) VALUES (
  (SELECT id FROM "User" WHERE email = 'joao@example.com'),
  79.50,
  'PENDING',
  '{"cep": "01310100", "street": "Av. Paulista", "number": "1578", "complement": "Apto 101", "neighborhood": "Bela Vista", "city": "São Paulo", "state": "SP", "country": "BR"}'::jsonb,
  'boleto',
  NOW(),
  NOW()
);

-- Order 4 - Guest (DELIVERED)
INSERT INTO "Order" (
  "userId", total, status, "shippingAddress", "paymentMethod", "createdAt", "updatedAt"
) VALUES (
  NULL,
  179.97,
  'DELIVERED',
  '{"cep": "30130100", "street": "Av. Afonso Pena", "number": "867", "neighborhood": "Centro", "city": "Belo Horizonte", "state": "MG", "country": "BR"}'::jsonb,
  'credit_card',
  NOW(),
  NOW()
);

-- ============================================
-- INSERIR ORDER ITEMS
-- ============================================
-- Order 1 Items (2x Classic Tee + 1x Sport Shorts)
INSERT INTO "OrderItem" ("orderId", "productId", price, quantity, size, "createdAt") VALUES
  (
    (SELECT id FROM "Order" WHERE total = 109.98 AND "userId" = (SELECT id FROM "User" WHERE email = 'joao@example.com') LIMIT 1),
    (SELECT id FROM "Product" WHERE slug = 'classic-tee'),
    29.99,
    2,
    'M',
    NOW()
  ),
  (
    (SELECT id FROM "Order" WHERE total = 109.98 AND "userId" = (SELECT id FROM "User" WHERE email = 'joao@example.com') LIMIT 1),
    (SELECT id FROM "Product" WHERE slug = 'sport-shorts'),
    24.00,
    1,
    'L',
    NOW()
  );

-- Order 2 Items (1x Vintage Hoodie + 1x Running Shoes + 1x Summer Dress)
INSERT INTO "OrderItem" ("orderId", "productId", price, quantity, size, "createdAt") VALUES
  (
    (SELECT id FROM "Order" WHERE total = 229.89),
    (SELECT id FROM "Product" WHERE slug = 'vintage-hoodie'),
    59.90,
    1,
    'L',
    NOW()
  ),
  (
    (SELECT id FROM "Order" WHERE total = 229.89),
    (SELECT id FROM "Product" WHERE slug = 'running-shoes'),
    119.99,
    1,
    '42',
    NOW()
  ),
  (
    (SELECT id FROM "Order" WHERE total = 229.89),
    (SELECT id FROM "Product" WHERE slug = 'summer-dress'),
    49.00,
    1,
    'M',
    NOW()
  );

-- Order 3 Item (1x Slim Jeans)
INSERT INTO "OrderItem" ("orderId", "productId", price, quantity, size, "createdAt") VALUES
  (
    (SELECT id FROM "Order" WHERE total = 79.50),
    (SELECT id FROM "Product" WHERE slug = 'slim-jeans'),
    79.50,
    1,
    '32',
    NOW()
  );

-- Order 4 Item (3x Classic Tee)
INSERT INTO "OrderItem" ("orderId", "productId", price, quantity, size, "createdAt") VALUES
  (
    (SELECT id FROM "Order" WHERE total = 179.97),
    (SELECT id FROM "Product" WHERE slug = 'classic-tee'),
    29.99,
    3,
    'L',
    NOW()
  );
