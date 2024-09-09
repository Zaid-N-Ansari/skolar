# Custom CSS Framework

## Introduction
This is a simple custom CSS framework designed to help you build responsive and styled webpages quickly. It includes a grid system, common UI components, and utility classes.

## Grid System
The grid system is based on a 12-column layout. Use the following classes to create responsive columns:

```html
<div class="container">
    <div class="row">
        <div class="col-4">Column 1</div>
        <div class="col-4">Column 2</div>
        <div class="col-4">Column 3</div>
    </div>
</div>
```

## Common UI Components
### Buttons
Use the .button class for basic styling and <code>.button-primary</code> for a primary button
```html
<a href="#" class="button button-primary">Primary Button</a>
```
### Cards
Cards
Cards can be created using the <code>.card</code> class. Titles and text can be styled using <code>.card-title</code> and <code>.card-text</code>
```html
<div class="card">
    <h2 class="card-title">Card Title</h2>
    <p class="card-text">This is some card content.</p>
</div>
```
### Forms
Form elements are styled with the .form-group class:
```html
<form>
	<div class="form-group">
		<label for="name">Name:</label>
		<input type="text" id="name" name="name">
	</div>
	<div class="form-group">
		<label for="message">Message:</label>
		<textarea id="message" name="message"></textarea>
	</div>
</form>
```

## Utility Classes
### Text Alignment
.text-center Center-aligns text.
### Margin
<code>.mt-1</code><code>.mt-2</code><code>.mt-3</code> Top margin
<br>
<br>
<code>.mb-1</code><code>.mb-2</code><code>.mb-3</code> Bottom margin.
### Padding
<code>.p-1</code><code>.p-2</code><code>.p-3</code> Applies Padding.
## Usage
Include the custom-framework.css file in your project to start using the framework. You can also customize the CSS file to fit your needs.

```html
<link rel="stylesheet" href="../styles/assign20.css">
```

## Example Usage
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Custom CSS Framework Example</title>
    <link href="custom-framework.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <header class="text-center mt-3">
            <h1>My Custom Framework</h1>
        </header>
        
        <section class="row mt-3">
            <div class="col-6">
                <div class="card">
                    <h2 class="card-title">Card Title</h2>
                    <p class="card-text">This is some content for the card.</p>
                    <a href="#" class="button button-primary">Learn More</a>
                </div>
            </div>
            <div class="col-6">
                <div class="card">
                    <h2 class="card-title">Another Card</h2>
                    <p class="card-text">More content goes here.</p>
                    <a href="#" class="button button-primary">Read More</a>
                </div>
            </div>
        </section>
        
        <section class="mt-3">
            <h2 class="text-center">Contact Us</h2>
            <form>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email">
                </div>
                <div class="form-group">
                    <label for="message">Message:</label>
                    <textarea id="message" name="message"></textarea>
                </div>
                <button type="submit" class="button button-primary">Send</button>
            </form>
        </section>
        
        <footer class="text-center mt-3">
            <p>&copy; 2024 Custom Framework</p>
        </footer>
    </div>
</body>
</html>
```