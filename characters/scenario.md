# Coding Scenario

## What's Up 

We are in the beginning stages of writing a game application with a
client-server architecture. The client is thin and will simply issue
the user's actions to the server which will return the game state
representation for the client to use when rendering a visual to the 
user.

We need the character and skill piece developed so we can play around
with ideas while the rest of the system is built.


## What's Needed 

### Characters 

A user's character can only start with 20 points allocated in anyway
the user wants to their attributes so long as each one is at least 1.
An attribute can never get above 100.

Attributes:
 
 * Intelligence
 * Strength
 * Agility
 * Charisma


### Skills

A character has all skills in the game available to them and they
start at level 1 for a new character. Skills go up by using abilities
that they provide to the character. Abilities are awarded through
skill advancements and 50 skill advancements increases the governing
attribute for the skill (each skill is governed by one attribute). 
Skills can be reduced by various game effects and abilities should be
temporarily removed until the skill level is reclaimed.

Skills are primarily internal to the character as only the abilities 
given actually interact with a character's skills. The rest of the game 
will interact with the character through the abilities.

An example skill could be 'marksmanship' which is governed by 'Agility' 
and an example advancement tree follows:

    * 1 - fire_pistol, fire_rifle 
    * 15 - fire_pistol2, fire_rifle2 (replaces 1st level abilities)
    * 30 - scoped_shot
    * 60 - fire_pistol3, fire_rifle3 (replaces 2nd level abilities)


### Abilities

Items and characters in the game will interact with each other
through a standardized interface (that we are still determining), but
underneath they will check and use the abilities on a character to 
determine the results of the action.

Abilities will take in and modify an ActionResults object that processed 
by the core game engine. The structure of this object is not determined
yet until the core game pipelines are built.

