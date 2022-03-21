const EXPRESS = require('express'),
  ROUTER = EXPRESS.Router(),
  MAHOUTOKORO_MASTER_ACCESSOR = require('../../security/accessors/masterAccessor'),
  ERROR_HELPER = require('../../utils/errorMessages/errorHelper'),
  SUCCESS_HELPER = require('../../utils/successMessages/successHelper'),
  { body, validationResult } = require('express-validator');

let arrErrors = [],
  arrSuccessMessages = [],
  arrValidationResult = [];

ROUTER.get('/anime/getanimes',
  body('intDataSet').isInt(),
  body('intDataLimit').isInt({min: 2, max: 100}),
  body('strOrderBy').isLength({min: 2, max: 32}),
  body('strOrder').isLength({min: 3, max: 4}),
  (req, res) => {
    arrValidationResult = validationResult(req);
    if (!arrValidationResult.isEmpty()) {
      return res.status(400).send({errors: arrValidationResult.array()});
    }
    arrErrors = [];
    let intDataSet = Number(req.body.intDataSet || 0),
      intDataLimit = Number(req.body.intDataLimit || 10),
      strOrderBy = req.body.strOrderBy,
      strOrder = req.body.strOrder,
      strOrderEscaped = strOrder === 'DESC' ? ' DESC ' : ' ASC ',
      arrInserts = [intDataSet, intDataLimit];
    MAHOUTOKORO_MASTER_ACCESSOR.getConnection((err, con) => {
      if (err) throw err;
      let stmt = 'SELECT * FROM anime ORDER BY ' + con.escapeId(strOrderBy) + strOrderEscaped + ' LIMIT ?, ?';
      con.query(stmt, arrInserts, (sqlErr, sqlRes, sqlFields) => {
        if (sqlErr) {
          console.error('/anime/getanimes: ' + sqlErr);
          arrErrors.push(ERROR_HELPER('SERVER_ERROR'));
          res.status(500).send({'errors': arrErrors});
        } else {
          res.status(200).send({'data': sqlRes});
        }
        con.release();
        if (err) throw err;
      });
    });
  });

module.exports = ROUTER;
