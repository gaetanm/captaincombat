# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

moon_sword = Weapon.create(name: "Moon Sword", attack: 25, defense: 0, weight: 30)
berserk_axe = Weapon.create(name: "Berserk Axe", attack: 50, defense: -20, weight: 20)
bastard_sword = Weapon.create(name: "Bastard Sword", attack: 15, defense: 0, weight: 10)

knight_shield = Shield.create(name: "Knight Shield", attack: 0, defense: 20, weight: 20)
wooden_shield = Shield.create(name: "Wooden Shield", attack: 0, defense: 10, weight: 10)
berserk_shield = Shield.create(name: "Berserk Shield", attack: 10, defense: 5, weight: 30)

guts = Fighter.create(name: "Guts", attack: "40", health: "60", weapon: berserk_axe, shield: berserk_shield)
aragorn = Fighter.create(name: "Aragorn", attack: "50", health: "50", weapon: bastard_sword, shield: wooden_shield)
artorias = Fighter.create(name: "Artorias", attack: "60", health: "40", weapon: moon_sword, shield: knight_shield)