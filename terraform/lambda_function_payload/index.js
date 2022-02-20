console.log('Loading function');
const AWS = require('aws-sdk');

exports.lambda_handler = (event, context, callback) => {
    var docClient = new AWS.DynamoDB.DocumentClient();
    var messageIds = []

    for (var i = 0; i < 10; i++) {
      console.log("Adding a new item...");
      var messageId = "MessageNo" + i.toString();
      messageIds.push(messageId);

      var message = "Hi! This is message no " + i.toString();
      var params = {
          TableName: "StepDataRecords",
          Item:{
              "MessageId": messageId,
              "Message": message
          }
      };
      docClient.put(params, function(err, data) {
          if (err) {
              console.error("Unable to add item. Error JSON:", JSON.stringify(err, null, 2));
          } else {
              console.log("Added item:", JSON.stringify(data, null, 2));
          }
      });
    };
    messageIds.push("DONE");
    callback(null, messageIds);
};
