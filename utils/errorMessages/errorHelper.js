/**
 * Returns an error message object by passing the error message key to the function.
 */
const ERROR_JSON = require('./errorMessages.json'),
  ARR_ERROR_OBJECTS = ERROR_JSON.errorMessages;

module.exports = (strKey) => {
  let errObject = ARR_ERROR_OBJECTS[0];
  ARR_ERROR_OBJECTS.forEach(function (element, index) {
    if (element.errorId === strKey) {
      errObject = ARR_ERROR_OBJECTS[index];
    }
  });
  return errObject;
}
