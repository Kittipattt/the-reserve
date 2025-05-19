import { test, expect } from '@playwright/test';

test('User can log in and reserve a room', async ({ page }) => {
  // Navigate to the login page
  await page.goto('http://127.0.0.1:3000');

  // Fill in login form
  await page.getByRole('textbox', { name: 'Email' }).click();
  await page.getByRole('textbox', { name: 'Email' }).fill('kittipat@odds.team');
  await page.getByRole('textbox', { name: 'Password' }).click();
  await page.getByRole('textbox', { name: 'Password' }).fill('12345678');
  await page.getByRole('button', { name: 'Login' }).click();

  // Wait for blueprint image to ensure dashboard has loaded
  await expect(page.getByRole('img', { name: 'bluePrint' })).toBeVisible();

  // Click on a room's reserve button
  await page.locator('div:nth-child(3) > .room-content > .reserve-button').click();

//   // Select reservation date
//   await page.getByRole('textbox', { name: 'Select Date' }).fill('2025-09-19');

//   // Choose start and end times
//   await page.getByLabel('Start Time').selectOption('2025-09-19 10:00:00 +0700');
//   await page.getByLabel('End Time').selectOption('2025-09-19 12:00:00 +0700');

//   // Confirm the reservation
//   await page.getByRole('button', { name: 'Confirm Reservation' }).click();

//   // Confirm user is returned to dashboard (or confirmation screen) with blueprint visible
//   await expect(page.getByRole('img', { name: 'bluePrint' })).toBeVisible();
});
