import express, { Request, Response } from 'express';
import { MysqlError } from 'mysql';
import { admin } from '../authorization/admin.js';
import { planner } from '../authorization/planner.js';
import { roleChecker } from '../authorization/roleChecker.js';
import { statist } from '../authorization/statist.js';
import { authenticator } from '../authorization/userValidation.js';
import db_knex from '../db/index_knex.js';
import {
  dbErrorHandler,
  requestErrorHandler,
  successHandler,
} from '../responseHandler/index.js';
import {
  validateCityPost,
  validateCityPut,
  validateDateEstablished,
} from '../validationHandler/city.js';
import { validate } from '../validationHandler/index.js';

const city = express.Router();

interface DbError extends MysqlError {
  errno: number;
}

// Get all cities
city.get(
  '/',
  [authenticator, admin, statist, planner, roleChecker, validate],
  (req: Request, res: Response) => {
    db_knex('City')
      .select()
      .then((data) => {
        successHandler(req, res, data, 'Successfully read the cities from  DB');
      })
      .catch((err: DbError) => {
        dbErrorHandler(
          req,
          res,
          err,
          'Error trying to read all cities from DB',
        );
      });
  },
);

// Get cities with "burg" in their name
city.get(
  '/burg',
  [authenticator, admin, roleChecker],
  (req: Request, res: Response) => {
    db_knex('City')
      .select()
      .where('name', 'like', '%burg%')
      .then((data) => {
        successHandler(
          req,
          res,
          data,
          'Successfully retrieved cities with "burg" in their name',
        );
      })
      .catch((error: DbError) => {
        dbErrorHandler(
          req,
          res,
          error,
          'Error retrieving cities with "burg" in their name',
        );
      });
  },
);

// Search cities by a text parameter
city.post('/search', (req: Request, res: Response) => {
  const { searchText } = req.body; // Expects JSON: { "searchText": "search term" }
  db_knex('City')
    .select()
    .where('name', 'like', `%${searchText}%`)
    .then((data) => {
      successHandler(
        req,
        res,
        data,
        'Successfully retrieved cities matching the search text',
      );
    })
    .catch((error: DbError) => {
      dbErrorHandler(req, res, error, 'Error searching cities by text');
    });
});

// Add a new city
city.post(
  '/',
  validateCityPost,
  [authenticator, admin, roleChecker],
  (req: Request, res: Response) => {
    db_knex('City')
      .insert(req.body)
      .then((idArray) => {
        successHandler(req, res, idArray, 'City added successfully');
      })
      .catch((error: DbError) => {
        dbErrorHandler(req, res, error, 'Error adding a new city');
      });
  },
);

// Get cities established before a certain date
city.post(
  '/establishedBefore',
  validateDateEstablished,
  [authenticator, admin, planner, roleChecker],
  (req: Request, res: Response) => {
    const { established } = req.body; // Expects JSON: { "established": "YYYY-MM-DD" }
    db_knex('City')
      .select()
      .where('established', '<', established)
      .then((data) => {
        successHandler(
          req,
          res,
          data,
          `Successfully retrieved cities established before ${established}`,
        );
      })
      .catch((error: DbError) => {
        dbErrorHandler(
          req,
          res,
          error,
          'Error retrieving cities established before the given date',
        );
      });
  },
);

// Update city information
city.put(
  '/:id',
  validateCityPut,
  [authenticator, admin, roleChecker],
  (req: Request, res: Response) => {
    const cityId = req.params.id;
    const { name, established, averageTemp } = req.body;

    if (!name) {
      return requestErrorHandler(req, res, 'City name is missing.');
    }

    db_knex('City')
      .where('id', cityId)
      .update({ name, established, averageTemp })
      .then((rowsAffected) => {
        if (rowsAffected === 1) {
          successHandler(
            req,
            res,
            rowsAffected,
            `Update city successful! Count of modified rows: ${rowsAffected}`,
          );
        } else {
          requestErrorHandler(
            req,
            res,
            `Update city not successful, ${rowsAffected} row modified`,
          );
        }
      })
      .catch((error: DbError) => {
        dbErrorHandler(req, res, error, 'Error updating city');
      });
  },
);

export default city;
