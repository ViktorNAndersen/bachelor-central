# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Admin.create(email: "admin@company.com", password: "password")

unit_stock = Stock.create
supplier_stock = Stock.create

supplier = Supplier.create(name: "Supplier Jack", address: "Milkyway 300", stock: supplier_stock)
unit = Unit.create(name: "Unit Barbosa", address: "Teapotstreet 418", stock: unit_stock, supplier: supplier)

employee = Employee.create(email: "employee@company.com", password: "password", location: unit)

product1 = Product.create(name: "Fish", description: "Flop flop, very delicate, handle with care", price: 10.0)
product2 = Product.create(name: "Coca Cola", description: "Better than pepsi", price: 3.0)
product3 = Product.create(name: "Tea", description: "In the year 1640 tea was introduced to the America's by the Dutch, and quickly became a staple in upper society households in what was known then as New Amsterdam", price: 5.0)

# Quantities
Quantity.create(product: product1, stock: unit_stock, amount: 20)
Quantity.create(product: product2, stock: unit_stock, amount: 40)
Quantity.create(product: product3, stock: unit_stock, amount: 100)

Quantity.create(product: product1, stock: supplier_stock, amount: 1000)
Quantity.create(product: product2, stock: supplier_stock, amount: 1000)
Quantity.create(product: product3, stock: supplier_stock, amount: 1000)

order = Order.create(status: 0, ordered_by: employee, total_price: 200.0)
completed_order = Order.create(status: 1, ordered_by: employee, total_price: 30)

OrderItem.create(order: order, product: product1, quantity: 10)
OrderItem.create(order: order, product: product3, quantity: 20)

OrderItem.create(order: completed_order, product: product2, quantity: 10)

Logs::Info.create(title: "New Order", description: "Order #1 was placed.", location: unit, user: employee)
