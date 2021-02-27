# Mini Remesh

## About

This is a lightweight API that allows you to create conversations. You can then create messages in those conversations. Finally, you can also create thoughts on any message. This API returns JSON responses.

## Getting Started

Clone this repository:

```
git clone https://github.com/dan-marino/remesh
```

Then, cd into the repository:

```
cd remesh
```

Next, you'll need to run `bundle install`

To run the test suite, just type `rspec` and hit enter

## Commands

To issue commands, you'll need to start the server. cd into `remesh` if you haven't already, and run `rails s`

This will start a server on `localhost:3000`

#### **Create Conversation:**

POST	*localhost:3000/api/conversations.json*

​	Set `Content-Type`  to `application/json`

​	Your JSON needs to be in this format:

​	`{"conversation": {"title": "THE TITLE OF YOUR CONVERSATION"}}`

Returns new Conversation

#### **Create Message:**

POST	*localhost:3000/api/conversations/:conversation_id.json*

​	Set `Content-Type`  to `application/json`

​	Your JSON needs to be in this format

​	`{"message": {"text": "THE TEXT OF YOUR MESSAGE"}}`

Returns new Message

#### **Create Thought:**

POST	*localhost:3000/api/messages/:message_id.json*

​	Set `Content-Type`  to `application/json`

​	Your JSON needs to be in this format:

​	`{"thought": {"text": "THE TEXT OF YOUR THOUGHT"}}`

Returns new Thought

#### **View all conversations:**

GET	*localhost:3000/api/conversations.json*

Returns array of Conversations

#### **View all messages and thoughts in a conversation:**

GET	*localhost:3000/api/conversations/:conversation_id.json*

Returns single Conversation with array of associated Messages. Each Message has an array of associated Thoughts.

#### **View all thoughts for a message:**

GET	*localhost:3000/api/messages/:message_id.json*

Returns single Message with array of associated Thoughts.

### Search Conversations

GET *localhost:3000/api/conversations?query=YOUR_SEARCH_PHRASE.json*

Returns array of Conversations which have titles that match your query

### Search Messages

GET *localhost:3000/api/messages?query=YOUR_SEARCH_PHRASE.json*

Returns array of Messages which have text that match your query
