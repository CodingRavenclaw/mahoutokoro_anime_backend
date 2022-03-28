const EXPRESS = require('express'),
  ROUTER = EXPRESS.Router(),
  MAHOUTOKORO_MASTER_ACCESSOR = require('../../security/accessors/masterAccessor'),
  ERROR_HELPER = require('../../utils/errorMessages/errorHelper'),
  SUCCESS_HELPER = require('../../utils/successMessages/successHelper'),
  { body, validationResult } = require('express-validator');

let arrErrors = [],
  arrSuccessMessages = [],
  arrValidationResult = [];

ROUTER.post('/anime/getanime',
  body('intDataSet').isInt(),
  body('intDataLimit').isInt({min: 2, max: 100}),
  body('strOrderBy').isLength({min: 2, max: 32}),
  body('strOrder').isLength({min: 3, max: 4}),
  body('strSearch').isLength({min: 0, max: 32}),
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
      strSearch = '%' + req.body.strSearch + '%',
      arrInserts = [strSearch, intDataSet, intDataLimit];
    MAHOUTOKORO_MASTER_ACCESSOR.getConnection((err, con) => {
      if (err) throw err;
      let stmt = "SELECT anime.anime_id, anime.name AS 'anime_name', studio.name AS 'studio_name', author.first_name AS 'author_first_name', author.last_name AS 'author_last_name', " +
        "anime.year, country.country_flag, anime.is_allowed " +
        "FROM anime, studio, author, country " +
        "WHERE (anime.studio_id = studio.studio_id AND anime.author_id = author.author_id AND anime.country = country.country_id) AND anime.name LIKE ?" +
        "ORDER BY " + con.escapeId(strOrderBy) + strOrderEscaped + " LIMIT ?, ?";
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

ROUTER.post('/anime/gettotalnumberofanime',
  body('strSearch').isLength({min: 0, max: 32}),
  (req, res) => {
    arrValidationResult = validationResult(req);
    if (!arrValidationResult.isEmpty()) {
      return res.status(400).send({errors: arrValidationResult.array()});
    }
    arrErrors = [];
    let strSearch = '%' + req.body.strSearch + '%',
      arrInserts = [strSearch];
    MAHOUTOKORO_MASTER_ACCESSOR.getConnection((err, con) => {
      if (err) throw err;
      let stmt = "SELECT COUNT(*) AS 'total_number_of_anime' FROM anime WHERE anime.name LIKE ?";
      con.query(stmt, arrInserts, (sqlErr, sqlRes, sqlFields) => {
        if (sqlErr) {
          console.error('/anime/gettotalnumberofanime: ' + sqlErr);
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
