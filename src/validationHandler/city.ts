import {
  createDateValidatorChain,
  createIdValidatorChain,
  validateDescription,
  validateIdObl,
  validateMultiDescription,
  validateMultiNameObl,
  validateNameObl,
} from '../validationHandler/index.js';

export const validateCityId = [...createIdValidatorChain('cityId')];

export const validateDateEstablished = [
  ...createDateValidatorChain('established'),
];

export const validateCityPost = [
  ...validateNameObl,
  ...validateDescription,
  ...validateDateEstablished,
];

export const validateCityPut = [...validateCityPost, ...validateIdObl];

export const validateCityMultiPost = [
  ...validateMultiNameObl,
  ...validateMultiDescription,
  ...validateDateEstablished,
];
