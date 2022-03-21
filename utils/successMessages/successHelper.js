const SUCCESS_MESSAGES_JSON = require('./successMessages.json'),
  ARR_SUCCESS_OBJECTS = SUCCESS_MESSAGES_JSON.successMessages;

module.exports = (strKey) => {
  let successObject = ARR_SUCCESS_OBJECTS[0];
  ARR_SUCCESS_OBJECTS.forEach(function (element, index) {
    if (element.successId === strKey) {
      successObject = ARR_SUCCESS_OBJECTS[index];
    }
  });
  return successObject;
}
